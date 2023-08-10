# frozen_string_literal: true

module Payrix
  module APIOperations
    module Create
      def create(fields, options = {})
        raise ArgumentError, "#{self}.create takes a hash argument" unless fields.is_a?(Hash)

        expand = Payrix::RequestOptions::Expand.construct(options[:expand] ||[])

        json, status = Http::Request.instance.send_http(
          'post',
          Payrix.configuration.url,
          "#{self::RESOURCE_ENDPOINT}?#{expand}",
          Payrix::Util.recursive_camel_case(fields),
          {
            'Content-Type' => 'application/json',
            'APIKEY' => options[:api_key] || Payrix.configuration.api_key,
          },
        )

        response = Http::Response.new(json, status, self)

        if response.errors?
          raise ApiError.new('There are errors in the response', response.data, response.errors)
        end

        Payrix::Object.instantiate_from(response.data.first)
      end
    end
  end
end
