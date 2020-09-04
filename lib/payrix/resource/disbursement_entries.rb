module Payrix
  module Resource
    class DisbursementEntries < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'disbursementEntries'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :disbursement, :entry, :pendingEntry, :reserveEntry, :event, 
               :eventId, :amount, :amountUsed, :description]

      attr_accessor *ATTRS

    end
  end
end
