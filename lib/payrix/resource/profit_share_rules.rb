module Payrix
  module Resource
    class ProfitShareRules < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'profitShareRules'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :profitShare, :name, :description, :type, :value, 
               :grouping, :inactive, :frozen]

      attr_accessor *ATTRS

    end
  end
end
