module Payrix
  module Resource
    class TeamLogins < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'teamLogins'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :team, :create, :read, :update, 
               :delete, :reference, :teamAdmin]

      attr_accessor *ATTRS

    end
  end
end
