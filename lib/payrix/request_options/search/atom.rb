# frozen_string_literal: true

module Payrix
  module RequestOptions
    module Search
      # A parent builder class that all field operators inherit from.
      class Atom < Node
        attr_reader :field, :operator, :value

        def initialize(field, operator, value)
          @field = field
          @operator = operator
          @value = value

          validate_field
          validate_operator
          validate_value

          super()
        end

        def construct(prefix = '')
          raise ArgumentError, 'Prefix parameter must be a string' unless prefix.is_a?(String)

          formatted_field = rendered_field(prefix)

          if prefix.empty?
            "#{formatted_field}[#{@operator}]=#{@value}"
          elsif formatted_field.start_with?('[')
            "#{prefix}#{formatted_field}[#{@operator}]=#{@value}"
          else
            "#{prefix}[#{formatted_field}][#{@operator}]=#{@value}"
          end
        end

        private

        def validate_field
          return if @field.is_a?(Symbol)
          raise ArgumentError, 'Field parameter must be a symbol or a non-empty string' unless valid_string_field?
          raise ArgumentError, 'Field parameter must not contain empty dot notation segments' if empty_dot_segment?
        end

        def valid_string_field?
          @field.is_a?(String) && @field != ''
        end

        def empty_dot_segment?
          @field.include?('.') && @field.split('.').any?(&:empty?)
        end

        def validate_operator
          return if @operator.is_a?(Symbol)
          return if @operator.is_a?(String) && @operator != ''

          raise ArgumentError, 'Operator parameter must be a symbol or a non-empty string'
        end

        def validate_value
          return if @value.is_a?(String) && @value != ''

          raise ArgumentError, 'Value parameter must be a non-empty string'
        end

        def rendered_field(prefix)
          return Payrix::Util.camel_case(@field.to_s) unless @field.is_a?(String) && @field.include?('.')

          dot_field(prefix.empty?)
        end

        def dot_field(unprefixed)
          parts = @field.split('.').map { |part| Payrix::Util.camel_case(part) }

          return parts.map { |part| "[#{part}]" }.join unless unprefixed

          [parts.first, *parts.drop(1).map { |part| "[#{part}]" }].join
        end
      end
    end
  end
end
