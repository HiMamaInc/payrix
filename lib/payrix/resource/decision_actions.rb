module Payrix
  module Resource
    class DecisionActions < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'decisionActions'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :decision, :action, :application, :scoreType, :type, 
               :field, :score, :data, :message, :code, 
               :grouping, :inactive, :frozen]

      attr_accessor *ATTRS

    end
  end
end
