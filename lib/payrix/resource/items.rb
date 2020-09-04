module Payrix
  module Resource
    class Items < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'items'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :txn, :item, :description, :custom, :quantity, 
               :price, :inactive, :frozen, :um, :commodityCode, 
               :total, :discount, :productCode]

      attr_accessor *ATTRS

    end
  end
end
