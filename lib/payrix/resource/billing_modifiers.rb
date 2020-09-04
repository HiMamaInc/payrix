module Payrix
  module Resource
    class BillingModifiers < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'billingModifiers'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :billing, :entity, :org, :division, :fromentity, 
               :inactive, :frozen]

      attr_accessor *ATTRS

    end
  end
end
