module Payrix
  module Resource
    class Alerts < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'alerts'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :forlogin, :team, :name, :description, 
               :inactive, :frozen, :division]

      attr_accessor *ATTRS

    end
  end
end
