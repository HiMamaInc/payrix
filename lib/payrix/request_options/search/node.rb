# frozen_string_literal: true

module Payrix
  module RequestOptions
    module Search
      class Node
        def construct
          raise NotImplementedError, '#construct must be implemented, and return a string'
        end
      end
    end
  end
end
