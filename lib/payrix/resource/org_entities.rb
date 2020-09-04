module Payrix
  module Resource
    class OrgEntities < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'orgEntities'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :org, :entity]

      attr_accessor *ATTRS

    end
  end
end
