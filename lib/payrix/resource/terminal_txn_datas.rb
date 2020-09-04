module Payrix
  module Resource
    class TerminalTxnDatas < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'terminalTxnDatas'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :terminalTxn, :signature]

      attr_accessor *ATTRS

    end
  end
end
