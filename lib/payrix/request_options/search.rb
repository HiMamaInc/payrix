# frozen_string_literal: true

require 'payrix/request_options/search/node'
require 'payrix/request_options/search/atom'
require 'payrix/request_options/search/equals'
require 'payrix/request_options/search/greater'
require 'payrix/request_options/search/less'

module Payrix
  module RequestOptions
    module Search
      def self.construct(filter)
        case filter
        when Hash
          return '' if filter.empty?

          filter
            .map { |key, value| equals(key, value).construct }
            .join('&')
        when Node
          filter.construct
        else
          raise ArgumentError, 'Search parameter must be a hash or an instance of Payrix::Search::Node'
        end
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
    end
  end
end
