# frozen_string_literal: true

module Payrix
  module RequestOptions
    module Expand
      def self.construct(expand)
        raise ArgumentError, 'Expand parameter must be an array of strings' unless expand.is_a?(Array)

        expand
          .map do |field|
            formatted_field =
              field
                .split('.')
                .map { |part| "[#{Payrix::Util.camel_case(part)}]" }
                .join

            "expand#{formatted_field}[]="
          end
          .join('&')
      end
    end
  end
end
