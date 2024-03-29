# frozen_string_literal: true

module Payrix
  module Http
    class Response # rubocop:disable Style/Documentation - Legacy file, which will be removed eventually
      attr_reader :status

      def initialize(response, status, cls)
        @response = response
        @status = status
        @cls = cls
      end

      def data
        (@response['response'] && @response['response']['data']) || []
      end

      # Return the response as an array
      def response
        data.map { |v| @cls.new(v) }
      end

      def errors
        @response['errors'] || (@response['response'] && @response['response']['errors']) || []
      end

      def errors?
        !errors.empty?
      end

      def details
        (@response['response'] && @response['response']['details']) || {}
      end

      def totals
        (@response['response'] && @response['response']['details'] && @response['response']['details']['totals']) || {}
      end

      def page
        @response['response'] && @response['response']['details'] && @response['response']['details']['page']
      end

      def more?
        page['hasMore']
      end
    end
  end
end
