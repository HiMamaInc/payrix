# frozen_string_literal: true

module Payrix
  module RequestOptions
    module Search
      # A builder class that constructs a valid 'or' search filter.
      class Or < Compound
        def initialize(*nodes)
          super(:or, *nodes)
        end
      end
    end
  end
end
