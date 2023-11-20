# frozen_string_literal: true

module Payrix
  module RequestOptions
    # A builder class that constructs a valid URL query parameter to be used API expansion.
    module Expand
      def self.construct(expand) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
        return '' if expand.nil? || expand == []

        raise ArgumentError, 'Expand option must be an array of strings' unless expand.is_a?(Array)

        expand.each do |field|
          raise ArgumentError, 'Expand option must be an array of strings' unless field.is_a?(String)
        end

        array = expand.map do |field|
          parts = field.split('.')
          parts = parts.map do |part|
            if part.end_with?('[]')
              # Faraday has issues serializing empty arrays as query parameters, so we give it a '0' here to help
              # it out.
              "[#{Payrix::Util.camel_case(part.split('[]').first)}][0]"
            else
              "[#{Payrix::Util.camel_case(part)}]"
            end
          end

          "expand#{parts.join}[]="
        end

        "#{array.join('&')}&"
      end
    end
  end
end
