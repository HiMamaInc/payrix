# frozen_string_literal: true

module Payrix
  module RequestOptions
    module Search
      class Equals < Atom
        def initialize(field, value)
          value = "''" if ['', nil].include?(value)

          super(field, :equals, value.to_s)
        end
      end
    end
  end
end
