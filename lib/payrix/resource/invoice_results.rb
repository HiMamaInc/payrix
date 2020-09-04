module Payrix
  module Resource
    class InvoiceResults < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'invoiceResults'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :invoice, :txn, :status, :message, :shippingFirst, 
               :shippingMiddle, :shippingLast, :shippingCompany, :shippingAddress1, :shippingAddress2, 
               :shippingCity, :shippingState, :shippingZip, :shippingCountry, :shippingPhone, 
               :shippingFax, :authorization, :authorizationData, :signature]

      attr_accessor *ATTRS

    end
  end
end
