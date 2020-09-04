module Payrix
  module Resource
    class MerchantResults < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'merchantResults'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :merchant, :type, :message]

      attr_accessor *ATTRS

    end
  end
end
