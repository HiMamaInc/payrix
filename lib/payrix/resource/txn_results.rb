module Payrix
  module Resource
    class TxnResults < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'txnResults'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :txn, :type, :message, :code, :bankCode, 
               :originalCode]

      attr_accessor *ATTRS

    end
  end
end
