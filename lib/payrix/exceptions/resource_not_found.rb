module Payrix
  module Exceptions
    class ResourceNotFound < Base
      def initialize(resource, id)
        super("Couldn't find #{resource} with id='#{id}'")
      end
    end
  end
end
