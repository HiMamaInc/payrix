module Payrix
  module Resource
    class StatementEntries < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'statementEntries'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :onentity, :billing, :statement, :fee, :profitShare, 
               :event, :eventId, :description, :amount, :deductedFromBalance, 
               :entity, :forentity]

      attr_accessor *ATTRS

    end
  end
end
