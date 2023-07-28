module Payrix
  module ExpandParameter
    def self.construct(expand)
      if !expand.is_a?(Array)
        raise ArgumentError, 'Expand parameter must be an array of strings'
      end

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
    end
  end
end
