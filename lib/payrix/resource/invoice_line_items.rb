module Payrix
  module Resource
    class InvoiceLineItems < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'invoiceLineItems'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :invoice, :invoiceItem, :quantity, :price, :discount, 
               :total]

      attr_accessor *ATTRS

    end
  end
end
