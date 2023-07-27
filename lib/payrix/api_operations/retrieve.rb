module Payrix
  module APIOperations
    module Retrieve
      def retrieve(id_or_hash, credentials = {})
        resource_id = nil
        api_key = credentials[:api_key] || Payrix.configuration.api_key
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

            case expand
              when NilClass
                # Skip
              when Array
                # ['entity']
                # # => ?expand[entity][]

                # ['entity.login']
                # # => ?expand[entity][login][]

                # ['entity.login.division', 'entity.accounts', 'members']
                # # => ?expand[entity][login][division][]&expand[entity][accounts][]&expand[members][]

                formatted_expand =
                  expand
                    .map { |field| "expand#{field.split('.').map { |part| "[#{Payrix::Utils.camel_case(part)}]" }.join}[]=" }
                    .join('&')

                api_endpoint += "?#{formatted_expand}"
              else
                raise ArgumentError, "Expand key must be an array"
            end
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
            'SEARCH' => "id[equals]=#{resource_id}",
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
