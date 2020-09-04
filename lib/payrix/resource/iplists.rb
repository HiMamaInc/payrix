module Payrix
  module Resource
    class Iplists < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'iplists'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :login, :version, :type, :start, :finish, 
               :inactive, :frozen]

      attr_accessor *ATTRS

    end
  end
end
