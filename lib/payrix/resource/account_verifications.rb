module Payrix
  module Resource
    class AccountVerifications < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'accountVerifications'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :account, :type]

      attr_accessor *ATTRS

    end
  end
end
