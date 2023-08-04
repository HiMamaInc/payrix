module Payrix
  module Util
    def self.camel_case(string)
      string.split('_').inject { |m, p| m + p.capitalize }
    end

    def self.snake_case(string)
      string.gsub(/(.)([A-Z])/, '\1_\2').downcase
    end

    def self.instantiate_object(data, resource = nil)
      case data
        when Hash
          Payrix::Object.new(data, resource)
        when Array
          data.map do |item|
            Payrix::Util.instantiate_object(item)
          end
        else
          data
      end
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
  end
end
