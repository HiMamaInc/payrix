module Payrix
  class Object
    attr_reader :data

    def initialize(data)
      @data = data

      @data.each do |key, value|
        parsed_key = Payrix::Util.snake_case(key.to_s)
        parsed_value = self.class.instantiate_from(value)

        define_singleton_method(parsed_key) { parsed_value }
      end
    end

    # Only support creating an instance of Payrix::Object through .instantiate_from.
    private_class_method :new

    def self.instantiate_from(data)
      case data
        when Hash
          new(data)
        when Array
          data.map do |item|
            instantiate_from(item)
          end
        else
          data
      end
    end

    def inspect
      parts = ["#<#{self.class}:#{'0x0000%x' % (object_id << 1)}"]

      parts.append("id=#{id}") if respond_to?(:id)
      parts.append(JSON.pretty_generate(Payrix::Util.recursive_snake_case(@data)))

      parts.join(' ') + '>'
    end
  end
end
