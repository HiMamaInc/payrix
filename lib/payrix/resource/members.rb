module Payrix
  module Resource
    class Members < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'members'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :merchant, :title, :first, :middle, :last, 
               :ssn, :dob, :dl, :dlstate, :ownership, 
               :email, :fax, :phone, :country, :zip, 
               :state, :city, :address2, :address1, :primary, 
               :inactive, :frozen, :timezone, :gender, :significantResponsibility, 
               :politicallyExposed, :citizenship]

      attr_accessor *ATTRS

    end
  end
end
