module Payrix
  module Resource
    class TxnMetadatas < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'txnMetadatas'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :txn, :type, :field, :value]

      attr_accessor *ATTRS

    end
  end
end
