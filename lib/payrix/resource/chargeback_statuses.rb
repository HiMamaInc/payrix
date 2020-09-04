module Payrix
  module Resource
    class ChargebackStatuses < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'chargebackStatuses'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :chargeback, :chargebackMessage, :status]

      attr_accessor *ATTRS

    end
  end
end
