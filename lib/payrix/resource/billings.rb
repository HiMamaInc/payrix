module Payrix
  module Resource
    class Billings < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'billings'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :entity, :org, :division, :description, 
               :schedule, :scheduleFactor, :start, :finish, :collection, 
               :collectionFactor, :collectionOffset, :collectionIncludeCurrent, :currency, :inactive, 
               :frozen, :forentity]

      attr_accessor *ATTRS

    end
  end
end
