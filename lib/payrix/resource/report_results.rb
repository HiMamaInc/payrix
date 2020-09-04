module Payrix
  module Resource
    class ReportResults < Base

      include Mixin::UpdateDisabled
      include Mixin::DeleteDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'reportResults'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :report, :type, :documentType, :original, :status, 
               :effective, :inactive, :frozen]

      attr_accessor *ATTRS

    end
  end
end
