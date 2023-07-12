module Payrix
  class BaseResource
    attr_reader :data

    def self.retrieve(id)
      endpoint = self::RESOURCE_ENDPOINT

      json, status = Http::Request.instance.send_http(
        'get',
        Payrix.configuration.url,
        endpoint,
        {},
        {
          'Content-Type' => 'application/json',
          'APIKEY' => Payrix.configuration.api_key,
          'SEARCH' => "id[equals]=#{id}",
        }
      )

      response = Http::Response.new(json, status, self)

      if response.data.first.nil?
        raise Payrix::Exceptions::ResourceNotFound.new(self, id)
      end

      new(response.data.first)
    end

    def initialize(data = {})
      @data = data
    end
  end
end
