module Payrix
  module Resource
    class Divisions < Base

      include Mixin::DeleteDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'divisions'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :name, :email]

      attr_accessor *ATTRS

    end
  end
end
