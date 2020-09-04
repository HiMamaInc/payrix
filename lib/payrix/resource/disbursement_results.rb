module Payrix
  module Resource
    class DisbursementResults < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'disbursementResults'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :disbursement, :code, :platform, :message, :disbursementRef, 
               :amount, :data, :originalCode]

      attr_accessor *ATTRS

    end
  end
end
