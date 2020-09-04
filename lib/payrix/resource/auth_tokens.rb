module Payrix
  module Resource
    class AuthTokens < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'authTokens'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :token, :customer, :used, :inactive, 
               :frozen]

      attr_accessor *ATTRS

    end
  end
end
