module Payrix
  class BaseResource
    attr_reader :data

    def self.retrieve(id, credentials = {})
      api_key = credentials[:api_key] || Payrix.configuration.api_key
      api_endpoint = self::RESOURCE_ENDPOINT

      json, status = Http::Request.instance.send_http(
        'get',
        Payrix.configuration.url,
        api_endpoint,
        {},
        {
          'Content-Type' => 'application/json',
          'APIKEY' => api_key,
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
      @key_mapping = {}

      # Create a key mapping so we can associate snake-cased keys with camel-cased equivalent.
      @data.keys.each do |key|
        @key_mapping[snake_case(key)] = key
      end

      # Create dynamic snake-cased methods.
      @key_mapping.keys.each do |key|
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

    def snake_case(string)
      string.gsub(/(.)([A-Z])/, '\1_\2').downcase
    end
  end
end
