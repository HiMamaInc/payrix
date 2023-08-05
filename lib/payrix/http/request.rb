# frozen_string_literal: true

require 'singleton'
require 'json'

require 'faraday'
require 'faraday/follow_redirects'

module Payrix
  module Http
    class Request
      include Singleton

      def send_http(method, base_url, endpoint, data = {}, headers = {}, timeout = 30)
        conn = Faraday.new(url: base_url) do |connection|
          connection.response :follow_redirects, limit: 3

          connection.headers = headers
          connection.options.timeout = timeout
          connection.options.open_timeout = timeout

          connection.request :json
          connection.adapter Faraday.default_adapter
        end

        begin
          response = conn.send(method.downcase.to_sym, endpoint, data)

          body = response.body
          status = response.status

          raise Payrix::Exceptions::InvalidAuthentication, 'Invalid authentication token' if status == 401
          if [400, 404].include?(status)
            raise Payrix::Exceptions::InvalidRequest, "Invalid request, status code: #{status}"
          end
          raise Payrix::Exceptions::Base, body if status < 200 || status > 299

          json = JSON.parse(body)

          [json, status]
        rescue Faraday::ClientError
          raise Payrix::Exceptions::Connection, ''
        rescue JSON::ParserError
          raise Payrix::Exceptions::InvalidResponse, 'Invalid response object'
        end
      end
    end
  end
end
