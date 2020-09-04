module Payrix
  module Resource
    class AlertTriggers < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'alertTriggers'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :alert, :event, :resource, :name, :description, 
               :inactive, :frozen]

      attr_accessor *ATTRS

    end
  end
end
