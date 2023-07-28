module Payrix
  module APIOperations
    module Retrieve
      def retrieve(id_or_hash, options = {})
        resource_id = nil
        api_key = options[:api_key] || Payrix.configuration.api_key
        api_endpoint = self::RESOURCE_ENDPOINT

        case id_or_hash
          when String
            resource_id = id_or_hash
          when Hash
            resource_id = id_or_hash[:id]

            unless resource_id
              raise Payrix::Exceptions::ResourceNotFound, "Couldn't find #{self} without ID"
            end

            expand = id_or_hash[:expand]

            api_endpoint += "?#{Payrix::ExpandParameter.construct(expand)}"
          else
            raise Payrix::Exceptions::ResourceNotFound, "Couldn't find #{self} without ID"
        end

        json, status = Http::Request.instance.send_http(
          'get',
          Payrix.configuration.url,
          api_endpoint,
          {},
          {
            'Content-Type' => 'application/json',
            'APIKEY' => api_key,
            'SEARCH' => Payrix::Search.equals(:id, resource_id).construct,
          }
        )

        response = Http::Response.new(json, status, self)

        if response.data.first.nil?
          raise Payrix::Exceptions::ResourceNotFound, "Couldn't find #{self} with id='#{resource_id}'"
        end

        new(response.data.first)
      end
    end
  end
end
