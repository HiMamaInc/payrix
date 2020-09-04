module Payrix
  module Resource
    class Notes < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'notes'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :hold, :txn, :terminalTxn, :entity, 
               :type, :note, :data, :inactive, :frozen]

      attr_accessor *ATTRS

    end
  end
end
