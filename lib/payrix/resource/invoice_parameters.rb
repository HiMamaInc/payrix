module Payrix
  module Resource
    class InvoiceParameters < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'invoiceParameters'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :entity, :org, :division, :type, 
               :value, :locked, :inactive, :frozen]

      attr_accessor *ATTRS

    end
  end
end
