module Payrix
  module Resource
    class Subscriptions < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'subscriptions'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :plan, :start, :finish, :tax, :descriptor, 
               :inactive, :frozen, :failures, :maxFailures, :origin, 
               :firstTxn, :txnDescription, :order, :authentication, :authenticationId, 
               :statementEntity]

      attr_accessor *ATTRS

    end
  end
end
