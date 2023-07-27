module Payrix
  module ExpandParameter
    def self.build_url(base_url, expand)
      case expand
        when Array
          formatted_expand =
            expand
              .map do |field|
                formatted_field =
                  field
                    .split('.')
                    .map { |part| "[#{Payrix::Utils.camel_case(part)}]" }
                    .join

                "expand#{formatted_field}[]="
              end
              .join('&')

          "#{base_url}?#{formatted_expand}"
        else
          raise ArgumentError, 'Expand parameter must be an array of strings'
      end
    end
  end
end
