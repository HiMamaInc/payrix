module Payrix
  module Resource
    class TerminalTxnResults < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'terminalTxnResults'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :terminalTxn, :type, :message, :code, :originalCode, 
               :bankCode]

      attr_accessor *ATTRS

    end
  end
end
