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
                .map do |part|
                  if part.end_with?('[]')
                    "[#{Payrix::Util.camel_case(part.split('[]').first)}][0]"
                  else
                    "[#{Payrix::Util.camel_case(part)}]"
                  end
                end
                .join

            "expand#{formatted_field}[]="
          end
          .join('&')
      end
    end
  end
end
