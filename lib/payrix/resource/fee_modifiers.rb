module Payrix
  module Resource
    class FeeModifiers < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'feeModifiers'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :fee, :entity, :org, :fromentity, :markupUm, 
               :markupAmount, :inactive, :frozen, :division]

      attr_accessor *ATTRS

    end
  end
end
