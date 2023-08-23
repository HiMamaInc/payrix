# frozen_string_literal: true

module Payrix
  module RequestOptions
    module Search
      # A parent builder class that all compound operators inherit from.
      class Compound < Node
        def initialize(operator, *args)
          @operator = operator
          @args = args

          validate_operator
          validate_args

          super()
        end

        def construct(prefix = '')
          raise ArgumentError, 'Prefix parameter must be a string' unless prefix.is_a?(String)

          @args
            .each_with_index
            .map do |arg, index|
              if prefix == ''
                arg.construct("#{@operator}[#{index}]")
              else
                arg.construct("#{prefix}[#{@operator}][#{index}]")
              end
            end
            .join('&')
        end

        private

        def validate_operator
          return if @operator.is_a?(Symbol)
          return if @operator.is_a?(String) && @operator != ''

          raise ArgumentError, 'Operator parameter must be a symbol or a non-empty string'
        end

        def validate_args
          if !@args.is_a?(Array) || @args.length < 2
            raise ArgumentError, 'Args parameter must be an array of 2+ search nodes'
          end

          @args.each do |arg|
            next if arg.is_a?(Node)

            raise ArgumentError, 'Args parameter must be an array of 2+ search nodes'
          end
        end
      end
    end
  end
end
