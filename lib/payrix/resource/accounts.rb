module Payrix
  module Resource
    class Accounts < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'accounts'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :entity, :account, :token, :name, :description, 
               :primary, :status, :currency, :inactive, :frozen, 
               :expiration, :type, :reserved, :checkStage]

      attr_accessor *ATTRS

    end
  end
end
