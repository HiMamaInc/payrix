module Payrix
  module Resource
    class Decisions < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'decisions'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :org, :entity, :decision, :type, 
               :target, :action, :sequence, :amount, :value, 
               :period, :periodFactor, :low, :high, :inactive, 
               :frozen, :division, :application, :options, :errorMessage, 
               :reason, :additionalOptions, :level, :schedule, :scheduleFactor, 
               :start, :finish, :useCache, :cacheTime]

      attr_accessor *ATTRS

    end
  end
end
