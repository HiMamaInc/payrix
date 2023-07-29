module Payrix
  class BaseResource
    attr_reader :data

    extend Payrix::APIOperations::Retrieve
    extend Payrix::APIOperations::List

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

      "#<#{self.class}:#{'0x0000%x' % (object_id << 1)} #{attributes.join(', ')}>"
    end

    private

    def self.nested_object(attribute, type)
      define_method(attribute) do
        ivar = "@#{attribute}"
        type_ = Payrix.const_get(type)

        return instance_variable_get(ivar) if instance_variable_defined?(ivar)

        existing_data = @data[@key_mapping[attribute.to_s]]

        result =
          case existing_data
            when Hash
              type_.new(existing_data)
            else
              existing_data
          end

        instance_variable_set(ivar, result)
      end
    end

    def self.nested_collection(attribute, collection_type)
      define_method(attribute) do
        ivar = "@#{attribute}"
        type = Payrix.const_get(collection_type)

        return instance_variable_get(ivar) if instance_variable_defined?(ivar)

        instance_variable_set(ivar, @data[@key_mapping[attribute.to_s]].map { |object| type.new(object) })
      end
    end

    def snake_case(string)
      string.gsub(/(.)([A-Z])/, '\1_\2').downcase
    end
  end
end
