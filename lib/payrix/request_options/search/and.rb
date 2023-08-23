# frozen_string_literal: true

module Payrix
  module RequestOptions
    module Search
      # A builder class that constructs a valid 'and' search filter.
      class And < Compound
        def initialize(*nodes)
          super(:and, *nodes)
        end
      end
    end
  end
end
