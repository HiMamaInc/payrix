module Payrix
  module Resource
    class ChargebackDocuments < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'chargebackDocuments'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :chargeback, :ref, :type, :name, :description, 
               :status, :inactive, :frozen]

      attr_accessor *ATTRS

    end
  end
end
