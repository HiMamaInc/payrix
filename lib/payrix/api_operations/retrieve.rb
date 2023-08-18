# frozen_string_literal: true

module Payrix
  module APIOperations
    # Extending your class with this module gives you a method to enable sending GET requests to the Payrix API.
    module Retrieve
      def retrieve(id, options = {})
        raise ArgumentError, "#{self}.retrieve takes a string argument" unless id.is_a?(String)

        client = Payrix::Client.new

        response =
          client
            .request(
              method: :get,
              resource: self::RESOURCE_ENDPOINT,
              data: {},
              filters: { id: id },
              options: options,
            )

        raise ApiError.new('There are errors in the response', response.data, response.errors) if response.errors?

        if response.data.first.nil?
          raise(
            Payrix::Exceptions::ResourceNotFound,
            "Couldn't find #{self} with id='#{id}'",
          )
        end

        Payrix::Object.instantiate_from(response.data.first)
      end
    end
  end
end
