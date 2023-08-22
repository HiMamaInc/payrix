# frozen_string_literal: true

module Payrix
  module RequestOptions
    module Search
      # A builder class that constructs a valid 'greater' search filter.
      class Greater < Atom
        def initialize(field, value)
          value = "''" if ['', nil].include?(value)

          super(field, :greater, value.to_s)
        end
      end
    end
  end
end
