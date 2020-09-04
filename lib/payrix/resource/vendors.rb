module Payrix
  module Resource
    class Vendors < Base

      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'vendors'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :entity, :division, :inactive, :frozen]

      attr_accessor *ATTRS

    end
  end
end
