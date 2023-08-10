# frozen_string_literal: true

module Payrix
  module APIOperations
    module Delete
      def delete(id, options = {})
        raise ArgumentError, "#{self}.delete takes a string argument" unless id.is_a?(String)

        json, status = Http::Request.instance.send_http(
          'delete',
          Payrix.configuration.url,
          "#{self::RESOURCE_ENDPOINT}/#{id}",
          {},
          {
            'Content-Type' => 'application/json',
            'APIKEY' => options[:api_key] || Payrix.configuration.api_key,
          },
        )

        response = Http::Response.new(json, status, self)

        raise ApiError.new('There are errors in the response', response.data, response.errors) if response.errors?

        Payrix::Object.instantiate_from(response.data.first)
      end
    end
  end
end
