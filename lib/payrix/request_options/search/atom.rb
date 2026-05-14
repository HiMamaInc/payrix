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

          if prefix == ''
            "#{format_field}[#{@operator}]=#{@value}"
          else
            "#{prefix}#{format_field}[#{@operator}]=#{@value}"
          end
        end

        private

        def validate_field
          return if @field.is_a?(Symbol)
          return if @field.is_a?(String) && @field != ''

          raise ArgumentError, 'Field parameter must be a symbol or a non-empty string'
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

        def format_field
          parts =
            case @field
            when Symbol
              [@field.to_s]
            when String
              @field.split('.')
            when Array
              @field.map(&:to_s)
            else
              raise ArgumentError, "Invalid field type: #{@field.class}"
            end

          parts
            .map { |part| "[#{Payrix::Util.camel_case(part)}]" }
            .join
        end
      end
    end
  end
end
