module Payrix
  module Resource
    class Holds < Base

      include Mixin::DeleteDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'holds'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :txn, :verification, :action, :released, 
               :reviewed, :inactive, :frozen, :entity, :terminalTxn, 
               :decisionAction, :account]

      attr_accessor *ATTRS

    end
  end
end
