module Payrix
  module Resource
    class Customers < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'customers'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :merchant, :first, :middle, :last, 
               :company, :email, :fax, :phone, :country, 
               :zip, :state, :city, :address2, :address1, 
               :inactive, :frozen, :shippingFirst, :shippingMiddle, :shippingLast, 
               :shippingCompany, :shippingAddress1, :shippingAddress2, :shippingCity, :shippingState, 
               :shippingZip, :shippingCountry, :shippingPhone, :shippingFax, :custom, 
               :authTokenCustomer]

      attr_accessor *ATTRS

    end
  end
end
