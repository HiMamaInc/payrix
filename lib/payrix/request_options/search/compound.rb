# frozen_string_literal: true

module Payrix
  module RequestOptions
    module Search
      # A parent builder class that all compound operators inherit from.
      class Compound < Node
        attr_reader :nodes

        def initialize(operator, *nodes)
          @operator = operator
          @nodes = nodes

          validate_operator
          validate_nodes

          super()
        end

        def construct(prefix = '')
          raise ArgumentError, 'Prefix parameter must be a string' unless prefix.is_a?(String)

          @nodes
            .each_with_index
            .map do |node, index|
              if prefix == ''
                node.construct("#{@operator}[#{index}]")
              else
                node.construct("#{prefix}[#{@operator}][#{index}]")
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

        def validate_nodes
          if !@nodes.is_a?(Array) || @nodes.length < 2
            raise ArgumentError, 'Nodes parameter must be an array of 2+ search nodes'
          end

          @nodes.each do |node|
            next if node.is_a?(Node)

            raise ArgumentError, 'Nodes parameter must be an array of 2+ search nodes'
          end
        end
      end
    end
  end
end
