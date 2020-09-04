module Payrix
  module Resource
    class Secrets < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'secrets'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :entity, :org, :division, :type, 
               :platform, :name, :description, :key, :locked, 
               :inactive, :frozen]

      attr_accessor *ATTRS

    end
  end
end
