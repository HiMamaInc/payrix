module Payrix
  module Resource
    class Reports < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'reports'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :type, :description, :status, :schedule, 
               :scheduleFactor, :start, :finish, :inactive, :frozen]

      attr_accessor *ATTRS

    end
  end
end
