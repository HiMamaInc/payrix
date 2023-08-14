# frozen_string_literal: true

module Payrix
  # The Payrix::Client is used both internally and externally to initiate API requests to the Payrix API.
  class Client
    def request(method:, resource:, data: {}, filters: {}, options: {})
      url = Payrix.configuration.url

      page_number = Payrix::RequestOptions::Paginate::Number.construct(options[:page])
      page_limit = Payrix::RequestOptions::Paginate::Limit.construct(options[:limit])
      expand = Payrix::RequestOptions::Expand.construct(options[:expand])
      endpoint = [resource, '?', page_number, page_limit, expand].join

      data = Payrix::Util.recursive_camel_case(data)

      api_key = options[:api_key] || Payrix.configuration.api_key
      search = Payrix::RequestOptions::Search.construct(filters)
      headers = {
        'Content-Type' => 'application/json',
        'APIKEY' => api_key,
        'SEARCH' => search,
      }

      json, status =
        Payrix::Http::Request
          .instance
          .send_http(method, url, endpoint, data, headers)

      Payrix::Http::Response.new(json, status, self)
    end
  end
end
