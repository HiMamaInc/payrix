module Payrix
  module Resource
    class ReportItems < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'reportItems'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :report, :search, :totals, :resource, :inactive, 
               :frozen, :expand, :expandSearch]

      attr_accessor *ATTRS

    end
  end
end
