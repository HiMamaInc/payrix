# frozen_string_literal: true

module Payrix
  module APIOperations
    # Extending your class with this module gives you a method to enable sending DELETE requests to the Payrix API.
    module Delete
      def delete(id, options = {})
        raise ArgumentError, "#{self}.delete takes a string argument" unless id.is_a?(String)

        client = Payrix::Client.new

        response =
          client
            .request(
              method: :delete,
              resource: "#{self::RESOURCE_ENDPOINT}/#{id}",
              options: options,
            )

        raise ApiError.new('There are errors in the response', response.data, response.errors) if response.errors?

        Payrix::Object.instantiate_from(response.data.first)
      end
    end
  end
end
