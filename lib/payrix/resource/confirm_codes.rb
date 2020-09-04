module Payrix
  module Resource
    class ConfirmCodes < Base

      include Mixin::UpdateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'confirmCodes'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :type, :email, :inactive, :frozen]

      attr_accessor *ATTRS

    end
  end
end
