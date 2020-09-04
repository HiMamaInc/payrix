module Payrix
  module Resource
    class ProfitShareResults < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'profitShareResults'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :profitShare, :entry, :amount, :message]

      attr_accessor *ATTRS

    end
  end
end
