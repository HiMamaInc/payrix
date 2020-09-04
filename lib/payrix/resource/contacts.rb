module Payrix
  module Resource
    class Contacts < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'contacts'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :entity, :first, :middle, :last, :description, 
               :email, :fax, :phone, :country, :zip, 
               :state, :city, :address2, :address1, :inactive, 
               :frozen]

      attr_accessor *ATTRS

    end
  end
end
