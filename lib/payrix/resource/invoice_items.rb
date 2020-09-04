module Payrix
  module Resource
    class InvoiceItems < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'invoiceItems'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :item, :description, :custom, :um, 
               :commodityCode, :productCode, :price, :inactive, :frozen]

      attr_accessor *ATTRS

    end
  end
end
