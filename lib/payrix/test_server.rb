# frozen_string_literal: true

require 'webmock'

module Payrix
  class TestAPI
    KLASS_TO_UUID_MAPPING = {
      Login => 'log',
      Merchant => 'mer',
      OrgEntity => 'oet',
      Payment => 'pmt',
      Txn => 'txn',
    }.freeze

    ENDPOINT_TO_KLASS_MAPPING =
      KLASS_TO_UUID_MAPPING
        .keys
        .map { |klass| [klass::RESOURCE_ENDPOINT, klass] }
        .to_h
        .freeze

    def self.generate_uuid(klass)
      universal_identifier = KLASS_TO_UUID_MAPPING[klass]
      characters = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']

      "t1_#{universal_identifier}_#{Array.new(23) { characters.sample }.join}"
    end

    def initialize
      @store = Store.new
      @history = History.new
      @endpoints = ENDPOINT_TO_KLASS_MAPPING.keys

      @endpoints.each do |endpoint|
        stub_post(endpoint)
        stub_delete(endpoint)
        stub_get(endpoint)
      end
    end

    def stub_retrieve(endpoint, id, values = {})
      check_endpoint!(endpoint)

      klass = ENDPOINT_TO_KLASS_MAPPING[endpoint]

      @store.add(endpoint, klass.resource_stub.merge(id: id).merge(values))
    end

    def created(endpoint, filter = {})
      check_endpoint!(endpoint)

      @history.created(endpoint, filter)
    end

    def deleted(endpoint, filter = {})
      check_endpoint!(endpoint)

      @history.deleted(endpoint, filter)
    end

    private

    def check_endpoint!(endpoint)
      return if @endpoints.include?(endpoint)

      raise ArgumentError, "Endpoint #{endpoint} does not exist."
    end

    class Request
      def initialize(request)
        @request = request
      end

      def endpoint
        @request.uri.path.split('/')[1]
      end

      def klass
        ENDPOINT_TO_KLASS_MAPPING[endpoint]
      end

      def body
        JSON.parse(@request.body).transform_keys(&:to_sym)
      end

      def path
        @request.uri.path
      end

      def search
        search = {}

        @request
          .headers['Search']
          .split('&')
          .each do |filter|
            match = filter.match(/(\w+)\[(\w+)\]=(.+)/)

            search[match[1].to_sym] = match[3]
          end

        search
      end
    end

    class Store
      def initialize
        @store = Hash.new { |h, k| h[k] = [] }
      end

      def add(endpoint, resource)
        @store[endpoint].push(resource)
      end

      def remove(endpoint, id)
        @store[endpoint].delete(id)
      end

      def retrieve(endpoint, filter = {})
        resources = @store[endpoint]

        resources.select do |resource|
          filter.all? { |k, v| resource[k].to_s == v }
        end
      end
    end

    class History
      def initialize
        @history = Hash.new { |h, k| h[k] = { created: [], deleted: [] } }
      end

      def created(endpoint, filter = {})
        klass = ENDPOINT_TO_KLASS_MAPPING[endpoint]

        created = @history[endpoint][:created]

        created.select do |resource|
          filter.all? { |k, v| resource[k] == v }
        end
      end

      def deleted(endpoint, filter = {})
        klass = ENDPOINT_TO_KLASS_MAPPING[endpoint]

        deleted = @history[endpoint][:deleted]

        deleted.select do |resource|
          filter.all? { |k, v| resource[k] == v }
        end
      end

      def record_creation(endpoint, resource)
        @history[endpoint][:created].push(resource)
      end

      def record_deletion(endpoint, resource)
        @history[endpoint][:deleted].push(resource)
      end
    end

    def stub_post(endpoint)
      WebMock
        .stub_request(:post, %r{^#{Payrix.configuration.url}/#{endpoint}.*$})
        .to_return do |request|
          request = Request.new(request)

          resource = request.klass.resource_stub.merge(request.body)

          @store.add(request.endpoint, resource)
          @history.record_creation(request.endpoint, resource)

          resources = @store.retrieve(request.endpoint, { id: resource[:id] })

          {
            status: 200,
            body: {
              response: {
                data: resources,
                details: {
                  requestId: 1,
                },
                errors: [],
              },
            }.to_json,
          }
        end
    end

    def stub_delete(endpoint)
      WebMock
        .stub_request(:delete, %r{^#{Payrix.configuration.url}/#{endpoint}/.*$})
        .to_return do |request|
          request = Request.new(request)

          id = request.path.split('/').last

          resource = @store.remove(request.endpoint, id)

          unless resource.nil?
            @history.record_deletion(request.endpoint, resource)
          end

          {
            status: 200,
            body: {
              response: {
                data: resource.nil? ? [] : [resource],
                details: {
                  requestId: 1,
                },
                errors: [],
              },
            }.to_json,
          }
        end
    end

    def stub_get(endpoint)
      WebMock
        .stub_request(:get, %r{^#{Payrix.configuration.url}/#{endpoint}.*$})
        .to_return do |request|
          request = Request.new(request)

          resources = @store.retrieve(request.endpoint, request.search)

          {
            status: 200,
            body: {
              response: {
                data: resources,
                details: {
                  requestId: 1,
                  totals: [],
                  page: {
                    current: 1,
                    last: 1,
                    hasMore: false,
                  },
                },
                errors: [],
              },
            }.to_json,
          }
        end
    end
  end
end
