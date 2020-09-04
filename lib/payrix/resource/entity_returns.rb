module Payrix
  module Resource
    class EntityReturns < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'entityReturns'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :entity, :payment, :txn, :disbursement, 
               :actionCode, :code, :message, :inactive, :frozen]

      attr_accessor *ATTRS

    end
  end
end
