module Payrix
  module Resource
    class Payouts < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'payouts'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :account, :entity, :payoutFlow, :name, 
               :description, :schedule, :scheduleFactor, :start, :currency, 
               :um, :amount, :minimum, :float, :skipOffDays, 
               :inactive, :frozen, :sameDay, :maximum, :billing]

      attr_accessor *ATTRS

    end
  end
end
