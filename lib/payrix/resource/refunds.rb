module Payrix
  module Resource
    class Refunds < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'refunds'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :entry, :description, :amount]

      attr_accessor *ATTRS

    end
  end
end
