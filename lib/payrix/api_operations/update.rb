# frozen_string_literal: true

module Payrix
  module APIOperations
    # Extending your class with this module gives you a method to enable sending PUT requests to the Payrix API.
    module Update
      def update(id, fields, options = {})
        if !id.is_a?(String) || !fields.is_a?(Hash)
          raise ArgumentError, "#{self}.update takes a string and a hash argument"
        end

        response =
          Payrix::Client
            .new
            .request(
              method: :put,
              resource: "#{self::RESOURCE_ENDPOINT}/#{id}",
              data: fields,
              options: options,
            )

        Payrix::Object.instantiate_from(response.data.first)
      end
    end
  end
end
