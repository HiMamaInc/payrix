module Payrix
  module Resource
    class Adjustments < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'adjustments'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :entity, :fromentity, :description, :amount, 
               :currency, :onentity]

      attr_accessor *ATTRS

    end
  end
end
