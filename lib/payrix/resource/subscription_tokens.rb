module Payrix
  module Resource
    class SubscriptionTokens < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'subscriptionTokens'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :subscription, :token, :inactive, :frozen]

      attr_accessor *ATTRS

    end
  end
end
