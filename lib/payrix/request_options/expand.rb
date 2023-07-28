module Payrix
  module Expand
    def self.construct(expand)
      if !expand.is_a?(Array)
        raise ArgumentError, 'Expand parameter must be an array of strings'
      end

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
