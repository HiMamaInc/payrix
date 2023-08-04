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
  end
end
