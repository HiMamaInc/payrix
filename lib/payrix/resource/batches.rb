module Payrix
  module Resource
    class Batches < Base

      include Mixin::DeleteDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'batches'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :merchant, :date, :status, :clientRef, :inactive, 
               :frozen, :processingDate, :processingId]

      attr_accessor *ATTRS

    end
  end
end
