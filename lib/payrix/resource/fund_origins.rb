module Payrix
  module Resource
    class FundOrigins < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'fundOrigins'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :fund, :disbursement, :amount]

      attr_accessor *ATTRS

    end
  end
end
