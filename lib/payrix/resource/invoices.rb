module Payrix
  module Resource
    class Invoices < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'invoices'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :merchant, :customer, :subscription, :number, 
               :title, :message, :emails, :total, :tax, 
               :discount, :type, :status, :dueDate, :expirationDate, 
               :sendOn, :emailStatus, :inactive, :frozen, :allowedPaymentMethods]

      attr_accessor *ATTRS

    end
  end
end
