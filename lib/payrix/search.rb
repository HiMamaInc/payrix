module Payrix
  module Search
    def self.equals(field, value)
      Equals.new(field, value)
    end

    private

    class Node
      def initialize(field, operator, value)
        @field = field
        @operator = operator
        @value = value
      end

      def construct
        "#{@field}[#{@operator}]=#{@value}&"
      end
    end

    class Equals < Node
      def initialize(field, value)
        value = value == '' || value == nil ? "''" : value

        super(field, 'equals', value)
      end
    end
  end
end
