module Payrix
  module Resource
    class Orgs < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'orgs'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :name, :description]

      attr_accessor *ATTRS

    end
  end
end
