require 'singleton'
require 'json'

require 'faraday'
require 'faraday_middleware'

module Payrix
  module Http
    class Request
      include Singleton

      def initialize
      end

      def send_http(method, base_url, endpoint, data = {}, headers = {}, timeout = 30)
        conn = Faraday.new(url: base_url) do |conn|
          conn.use FaradayMiddleware::FollowRedirects, limit: 3

          conn.headers = headers
          conn.options.timeout = timeout
          conn.options.open_timeout = timeout

          conn.request :json
          conn.adapter Faraday.default_adapter
        end

        begin
          response = conn.send(method.downcase.to_sym, endpoint, data)

          body = response.body
          status = response.status

          raise Payrix::Exceptions::InvalidRequest.new("Invalid request, status code: #{status}") if status == 400 || status == 404
          raise Payrix::Exceptions::Base.new(body) if status < 200 || status > 299

          json = JSON.parse(body)

          return json, status
        rescue Faraday::ClientError => e
          raise Payrix::Exceptions::Connection.new('')
        rescue JSON::ParserError
          raise Payrix::Exceptions::InvalidResponse.new('Invalid response object') if Payrix.configuration.exception_enabled
        end
      end

    end
  end
end
