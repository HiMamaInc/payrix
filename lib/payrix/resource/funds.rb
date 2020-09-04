module Payrix
  module Resource
    class Funds < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'funds'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :entity, :currency, :reserved, :pending, :available, 
               :total, :inactive, :frozen]

      attr_accessor *ATTRS

    end
  end
end
