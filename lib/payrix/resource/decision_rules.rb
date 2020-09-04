module Payrix
  module Resource
    class DecisionRules < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'decisionRules'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :decision, :name, :description, :type, :value, 
               :grouping, :inactive, :frozen]

      attr_accessor *ATTRS

    end
  end
end
