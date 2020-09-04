module Payrix
  module Resource
    class ReserveEntries < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'reserveEntries'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :fund, :txn, :hold, :reserve, 
               :entityReserve, :reserveEntry, :description, :release, :amount, 
               :onentity, :entry, :event, :eventId, :status, 
               :statusMessage]

      attr_accessor *ATTRS

    end
  end
end
