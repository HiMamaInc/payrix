# frozen_string_literal: true

require 'payrix/request_options/search/node'
require 'payrix/request_options/search/atom'
require 'payrix/request_options/search/equals'
require 'payrix/request_options/search/greater'

module Payrix
  module Search
    def self.construct(filter)
      search = ''

      case filter
      when Hash
        return search if filter.empty?

        filter.each do |key, value|
          search += Payrix::Search.equals(key, value).construct
        end
      when Payrix::Search::Node
        search += filter.construct
      else
        raise ArgumentError, 'Search parameter must be a hash or an instance of Payrix::Search::Node'
      end

      search
    end

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
        value = "''" if ['', nil].include?(value)

        super(field, 'equals', value)
      end
    end

    class Greater < Node
      def initialize(field, value)
        value = "''" if ['', nil].include?(value)

        super(field, 'greater', value)
      end
    end

    class Less < Node
      def initialize(field, value)
        value = "''" if ['', nil].include?(value)

        super(field, 'less', value)
      end
    end
  end
end
