# frozen_string_literal: true

module Payrix
  module APIOperations
    # Extending your class with this module gives you a method to enable sending DELETE requests to the Payrix API.
    module Delete
      def delete(id, options = {})
        raise ArgumentError, "#{self}.delete takes a string argument" unless id.is_a?(String)

        response =
          Payrix::Client
            .new
            .request(
              method: :delete,
              resource: "#{self::RESOURCE_ENDPOINT}/#{id}",
              options: options,
            )

        Payrix::Object.instantiate_from(response.data.first)
      end
    end
  end
end
