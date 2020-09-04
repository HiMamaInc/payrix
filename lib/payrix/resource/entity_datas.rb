module Payrix
  module Resource
    class EntityDatas < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'entityDatas'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :entity, :tcAcceptSignature]

      attr_accessor *ATTRS

    end
  end
end
