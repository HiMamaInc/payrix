# frozen_string_literal: true

module Payrix
  # The Payrix::Client is used both internally and externally to initiate API requests to the Payrix API.
  class Client
    def request(method:, resource:, data: {}, filters: {}, options: {})
      url = Payrix.configuration.url(options[:region], options[:environment])

      page_number = Payrix::RequestOptions::Page::Number.construct(options[:page])
      page_limit = Payrix::RequestOptions::Page::Limit.construct(options[:limit])
      expand = Payrix::RequestOptions::Expand.construct(options[:expand])
      endpoint = [resource, '?', page_number, page_limit, expand].join

      data = Payrix::Util.recursive_camel_case(data)

      headers = request_headers(filters, options)

      json, status =
        Payrix::Http::Request
          .instance
          .send_http(method, url, endpoint, data, headers)

      response = Payrix::Http::Response.new(json, status, self)

      raise ApiError.new('There are errors in the response', response.data, response.errors) if response.errors?

      response
    end

    private

    def request_headers(filters, options)
      headers = {
        'Content-Type' => 'application/json',
        'APIKEY' => options[:api_key] || Payrix.configuration.api_key,
        'SEARCH' => Payrix::RequestOptions::Search.construct(filters),
      }

      request_token = options[:request_token]
      headers['REQUEST-TOKEN'] = request_token.to_s unless request_token.to_s.empty?

      headers
    end
  end
end
