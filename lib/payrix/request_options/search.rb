module Payrix
  module Search
    def self.equals(field, value)
      Equals.new(field, value)
    end

    def self.greater(field, value)
      Greater.new(field, value)
    end

    def self.less(field, value)
      Less.new(field, value)
    end

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

    class Greater < Node
      def initialize(field, value)
        value = value == '' || value == nil ? "''" : value

        super(field, 'greater', value)
      end
    end

    class Less < Node
      def initialize(field, value)
        value = value == '' || value == nil ? "''" : value

        super(field, 'less', value)
      end
    end
  end
end
