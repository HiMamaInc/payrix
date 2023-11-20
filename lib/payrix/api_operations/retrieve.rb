# frozen_string_literal: true

module Payrix
  module APIOperations
    # Extending your class with this module gives you a method to enable sending GET requests to the Payrix API for a
    # single record.
    module Retrieve
      def retrieve(id, options = {})
        raise ArgumentError, "#{self}.retrieve takes a string argument" unless id.is_a?(String)

        response =
          Payrix::Client
            .new
            .request(
              method: :get,
              resource: self::RESOURCE_ENDPOINT,
              data: {},
              filters: { id: id },
              options: options,
            )

        raise Payrix::NotFoundError, "Couldn't find #{self} with id='#{id}'" if response.data.first.nil?

        Payrix::Object.instantiate_from(response.data.first)
      end
    end
  end
end
