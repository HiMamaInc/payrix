module Payrix
  module Resource
    class MessageThreads < Base

      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'messageThreads'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :forlogin, :hold, :entityReturn, :opposingMessageThread, 
               :folder, :sender, :recipient, :subject]

      attr_accessor *ATTRS

    end
  end
end
