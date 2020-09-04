module Payrix
  module Resource
    class Chargebacks < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'chargebacks'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :merchant, :txn, :description, :total, :representedTotal, 
               :cycle, :currency, :ref, :reason, :reasonCode, 
               :issued, :received, :reply, :bankRef, :chargebackRef, 
               :status, :lastStatusChange, :inactive, :frozen, :actionable]

      attr_accessor *ATTRS

    end
  end
end
