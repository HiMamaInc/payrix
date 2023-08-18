# frozen_string_literal: true

module Payrix
  module APIOperations
    # Extending your class with this module gives you a method to enable sending POST requests to the Payrix API.
    module Create
      def create(fields, options = {})
        raise ArgumentError, "#{self}.create takes a hash argument" unless fields.is_a?(Hash)

        response =
          Payrix::Client
            .new
            .request(
              method: :post,
              resource: self::RESOURCE_ENDPOINT,
              data: fields,
              options: options,
            )

        Payrix::Object.instantiate_from(response.data.first)
      end
    end
  end
end
