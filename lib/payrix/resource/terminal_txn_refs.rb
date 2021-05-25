module Payrix
  module Resource
    class TerminalTxnRefs < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'terminalTxnRefs'
      end

      ATTRS = [:terminalTxn, :ref, :stage]

      attr_accessor *ATTRS

    end
  end
end
