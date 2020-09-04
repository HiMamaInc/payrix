module Payrix
  module Resource
    class ChargebackMessageResults < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'chargebackMessageResults'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :chargebackMessage, :type, :message]

      attr_accessor *ATTRS

    end
  end
end
