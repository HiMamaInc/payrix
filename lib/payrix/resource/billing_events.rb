module Payrix
  module Resource
    class BillingEvents < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'billingEvents'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :billing, :event, :eventSchedule, :deductFromBalance, :inactive, 
               :frozen]

      attr_accessor *ATTRS

    end
  end
end
