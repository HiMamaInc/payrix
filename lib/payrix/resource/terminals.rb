module Payrix
  module Resource
    class Terminals < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'terminals'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :merchant, :type, :capability, :environment, :autoClose, 
               :autoCloseTime, :name, :description, :address1, :address2, 
               :city, :state, :zip, :country, :timezone, 
               :status, :phone, :serial, :cloudEnabled]

      attr_accessor *ATTRS

    end
  end
end
