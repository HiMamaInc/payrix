module Payrix
  module Resource
    class EntityReserves < Base

      include Mixin::DeleteDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'entityReserves'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :fund, :total, :name, :description, 
               :requestSequence, :processedSequence]

      attr_accessor *ATTRS

    end
  end
end
