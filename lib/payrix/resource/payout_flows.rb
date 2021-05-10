module Payrix
  module Resource
    class PayoutFlows < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'payoutFlows'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :payoutLogin, :org, :entity, :trigger, 
               :schedule, :scheduleFactor, :um, :amount, :minimum, 
               :payoutInactive, :skipOffDays, :inactive, :frozen, :division, 
               :secondaryDescriptor, :billing]

      attr_accessor *ATTRS

    end
  end
end
