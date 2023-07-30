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
        @key_mapping[Util.snake_case(key)] = key
      end

      # Create dynamic snake-cased methods.
      @key_mapping.keys.each do |key|
        next if respond_to?(key)

        self.class.define_method(key) { @data[@key_mapping[key]] }
      end
    end

    def inspect
      json = JSON.pretty_generate(@data.transform_keys { |key| Util.snake_case(key) })

      "#<#{self.class}:#{'0x0000%x' % (object_id << 1)} id=#{id} #{json}>"
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
  end
end
