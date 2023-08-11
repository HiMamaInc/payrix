# frozen_string_literal: true

module Payrix
  module APIOperations
    module Update
      def update(id, fields, options = {})
        if !id.is_a?(String) || !fields.is_a?(Hash)
          raise ArgumentError, "#{self}.update takes a string and a hash argument"
        end

        json, status = Http::Request.instance.send_http(
          'put',
          Payrix.configuration.url,
          "#{self::RESOURCE_ENDPOINT}/#{id}",
          Payrix::Util.recursive_camel_case(fields),
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
