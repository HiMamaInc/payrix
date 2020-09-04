module Payrix
  module Resource
    class FeeRules < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'feeRules'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :fee, :name, :description, :type, :application, 
               :value, :inactive, :frozen, :grouping]

      attr_accessor *ATTRS

    end
  end
end
