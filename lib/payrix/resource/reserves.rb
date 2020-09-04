module Payrix
  module Resource
    class Reserves < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'reserves'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :org, :entity, :name, :description, 
               :percent, :release, :releaseFactor, :finish, :inactive, 
               :frozen, :max, :start, :hold, :division, 
               :level]

      attr_accessor *ATTRS

    end
  end
end
