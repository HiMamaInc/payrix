module Payrix
  module Resource
    class ProfitShares < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'profitShares'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :entity, :forentity, :org, :division, 
               :type, :name, :description, :amount, :inactive, 
               :frozen]

      attr_accessor *ATTRS

    end
  end
end
