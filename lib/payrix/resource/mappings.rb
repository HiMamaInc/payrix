module Payrix
  module Resource
    class Mappings < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'mappings'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :name, :description, :input, :output, 
               :namespace]

      attr_accessor *ATTRS

    end
  end
end
