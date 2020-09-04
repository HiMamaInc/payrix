module Payrix
  module Resource
    class OrgFlowActions < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'orgFlowActions'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :orgFlow, :org, :action]

      attr_accessor *ATTRS

    end
  end
end
