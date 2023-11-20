# frozen_string_literal: true

module Payrix
  module RequestOptions
    module Search
      # An abstract class that all search builder class should inherit from.
      class Node
        def construct
          raise NotImplementedError, '#construct must be implemented, and return a string'
        end
      end
    end
  end
end
