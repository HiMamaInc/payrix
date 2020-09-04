module Payrix
  module Resource
    class Logins < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'logins'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :lastLogin, :username, :password, :first, 
               :middle, :last, :email, :fax, :phone, 
               :country, :zip, :state, :city, :address2, 
               :address1, :confirmed, :roles, :division, :inactive, 
               :frozen, :allowedResources, :restrictedResources, :parentDivision, :portalAccess, 
               :effectiveRoles]

      attr_accessor *ATTRS

    end
  end
end
