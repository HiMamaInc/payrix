# frozen_string_literal: true

module Payrix
  module RequestOptions
    module Search
      # A builder class that constructs a valid 'less' search filter.
      class Less < Atom
        def initialize(field, value)
          value = "''" if ['', nil].include?(value)

          super(field, :less, value.to_s)
        end
      end
    end
  end
end
