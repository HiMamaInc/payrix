module Payrix
  class Object
    attr_reader :_data

    def initialize(data = {}, resource = nil)
      @_data = data
      @resource = resource

      @_data.each do |key, value|
        parsed_key = Util.snake_case(key.to_s)
        parsed_value = Util.instantiate_object(value)

        define_singleton_method(parsed_key) { parsed_value }
      end
    end

    def inspect
      resource = " resource=#{@resource}" if @resource
      id_string = " id=#{id}" if respond_to?(:id)
      json = JSON.pretty_generate(@_data)

      "#<#{self.class}:#{'0x0000%x' % (object_id << 1)}#{resource}#{id_string} #{json}>"
    end
  end
end
