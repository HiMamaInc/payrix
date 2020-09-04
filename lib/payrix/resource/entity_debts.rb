module Payrix
  module Resource
    class EntityDebts < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'entityDebts'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :entity, :toentity]

      attr_accessor *ATTRS

    end
  end
end
