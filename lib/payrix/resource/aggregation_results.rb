module Payrix
  module Resource
    class AggregationResults < Base

      include Mixin::UpdateDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'aggregationResults'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :aggregationResultGroup, :field, :count, :sum, :min, 
               :max, :grouping]

      attr_accessor *ATTRS

    end
  end
end
