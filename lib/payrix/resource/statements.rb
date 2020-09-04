module Payrix
  module Resource
    class Statements < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      include Mixin::CreateDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'statements'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :billing, :status, :totalPaid, :total, :currency, 
               :forentity, :entity, :start, :finish]

      attr_accessor *ATTRS

    end
  end
end
