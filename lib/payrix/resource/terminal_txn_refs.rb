module Payrix
  module Resource
    class TerminalTxnMetadatas < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'terminalTxnMetadatas'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :terminalTxn, :type, :field, :value]

      attr_accessor *ATTRS

    end
  end
end

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'terminalTxnMetadatas'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :terminalTxn, :type, :field, :value]

      attr_accessor *ATTRS

    end
  end
end
