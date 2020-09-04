module Payrix
  module Resource
    class Sessions < Base

      include Mixin::UpdateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'sessions'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :key, :public, :inactive, :frozen, 
               :token, :effectiveRoles]

      attr_accessor *ATTRS

    end
  end
end
