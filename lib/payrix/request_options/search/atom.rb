# frozen_string_literal: true

module Payrix
  module RequestOptions
    module Search
      class Atom < Node
        attr_reader :field, :operator, :value

        def initialize(field, operator, value)
          @field = field
          @operator = operator
          @value = value

          validate_field
          validate_operator
          validate_value
        end

        def construct(prefix = '')
          raise ArgumentError, 'Prefix parameter must be a string' unless prefix.is_a?(String)

          field = Payrix::Util.camel_case(@field.to_s)

          if prefix == ''
            "#{field}[#{@operator}]=#{@value}"
          else
            "#{prefix}[#{field}][#{@operator}]=#{@value}"
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
      end
    end
  end
end
