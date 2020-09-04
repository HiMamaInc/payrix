module Payrix
  module Resource
    class OrgFlows < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'orgFlows'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :forlogin, :trigger, :team, :division]

      attr_accessor *ATTRS

    end
  end
end
