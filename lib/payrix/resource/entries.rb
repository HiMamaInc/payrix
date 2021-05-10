module Payrix
  module Resource
    class Entries < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'entries'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :entity, :onentity, :fromentity, :opposingEntry, :fund, 
               :fee, :disbursement, :refund, :txn, :chargeback, 
               :adjustment, :profitShare, :event, :eventId, :description, 
               :amount, :unsourced, :pending, :originalCurrency, :currencyRate, 
               :isFee, :statement, :settlement, :archiveSummary, :pendingEntry, 
               :pendingEntryCreated, :originalEventId, :originalEvent]

      attr_accessor *ATTRS

    end
  end
end
