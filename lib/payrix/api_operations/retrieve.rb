module Payrix
  module APIOperations
    module Retrieve
      def retrieve(id, options = {})
        if !id.is_a?(String)
          raise Payrix::Exceptions::ResourceNotFound, "Couldn't find #{self} without ID"
        end

        api_key = options[:api_key] || Payrix.configuration.api_key
        expand = Payrix::Expand.construct(options[:expand] || [])
        search = Payrix::Search.equals(:id, id).construct

        json, status = Http::Request.instance.send_http(
          'get',
          Payrix.configuration.url,
          "#{self::RESOURCE_ENDPOINT}?#{expand}",
          {},
          {
            'Content-Type' => 'application/json',
            'APIKEY' => api_key,
            'SEARCH' => search,
          }
        )

        response = Http::Response.new(json, status, self)

        if response.data.first.nil?
          raise Payrix::Exceptions::ResourceNotFound, "Couldn't find #{self} with id='#{id}'"
        end

        Payrix::Object.new(response.data.first, self.to_s.gsub('Payrix::', ''))
      end
    end
  end
end
