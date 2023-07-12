module Payrix
  class BaseResource
    attr_reader :data

    def self.retrieve(id_or_hash, credentials = {})
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

          formatted_expand =
            expand
              .map { |field| "expand[#{field}][]" }
              .join('&')

          api_endpoint += "?#{formatted_expand}"
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

    def initialize(data = {})
      @data = data
      @key_mapping = {}

      # Create a key mapping so we can associate snake-cased keys with camel-cased equivalent.
      @data.keys.each do |key|
        @key_mapping[snake_case(key)] = key
      end

      # Create dynamic snake-cased methods.
      @key_mapping.keys.each do |key|
        next if respond_to?(key)

        self.class.define_method(key) { @data[@key_mapping[key]] }
      end
    end

    def inspect
      attributes = @key_mapping.keys.sort.map do |key|
        value = @data[@key_mapping[key]]

        case value
          when NilClass
            "#{key}: nil"
          when String
            "#{key}: \"#{value}\""
          when Hash
            id = value['id']

            if id
              "#{key}: \"#{id}\""
            else
              "#{key}: #{value}"
            end
          else
            "#{key}: #{value}"
        end
      end

      "<#{self.class}:#{'0x0000%x' % (object_id << 1)} #{attributes.join(', ')}>"
    end

    private

    def self.define_expansion(attribute, type)
      define_method(attribute) do
        ivar = "@#{attribute}"

        return instance_variable_get(ivar) if instance_variable_defined?(ivar)

        existing_data = @data[@key_mapping[attribute.to_s]]

        result =
          case existing_data
            when String
              type.retrieve(existing_data)
            when Hash
              type.new(existing_data)
          end

        instance_variable_set(ivar, result)
      end
    end

    def snake_case(string)
      string.gsub(/(.)([A-Z])/, '\1_\2').downcase
    end
  end
end
