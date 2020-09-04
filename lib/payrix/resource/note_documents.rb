module Payrix
  module Resource
    class NoteDocuments < Base

      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'noteDocuments'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :note, :custom, :type, :documentType, :name, 
               :description, :status, :inactive, :frozen]

      attr_accessor *ATTRS

    end
  end
end
