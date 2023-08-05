module Payrix
  module Util
    def self.camel_case(string)
      string.split('_').inject { |part1, part2| part1 + part2.capitalize }
    end

    def self.snake_case(string)
      string.gsub(/(.)([A-Z])/, '\1_\2').downcase
    end

    def self.recursive_snake_case(object)
      case object
        when Hash
          object.each_with_object({}) do |(key, value), hash|
            hash[Util.snake_case(key.to_s)] = Util.recursive_snake_case(value)
          end
        when Array
          object.map do |item|
            Util.recursive_snake_case(item)
          end
        else
          object
      end
    end

    def self.get(klass:, filters: {}, options: {})
      paginate = Payrix::Paginate.construct(options[:page])
      expand = Payrix::Expand.construct(options[:expand] || [])
      search = Payrix::Search.construct(filters)

      endpoint = klass::RESOURCE_ENDPOINT + '?'
      endpoint += paginate if options[:page]
      endpoint += expand

      json, status = Http::Request.instance.send_http(
        'get',
        Payrix.configuration.url,
        endpoint,
        {},
        {
          'Content-Type' => 'application/json',
          'APIKEY' => options[:api_key] || Payrix.configuration.api_key,
          'SEARCH' => search,
        },
      )

      response = Http::Response.new(json, status, klass)
    end
  end
end
