module Payrix
  module Resource
    class PaymentUpdateGroups < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'paymentUpdateGroups'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :entity, :payment]

      attr_accessor *ATTRS

    end
  end
end
