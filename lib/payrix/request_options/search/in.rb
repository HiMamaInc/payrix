# frozen_string_literal: true

module Payrix
  module RequestOptions
    module Search
      # A builder class that constructs a valid 'in' search filter.
      class In < Atom
        def initialize(field, values)
          values = Array(values).compact.map(&:to_s).reject(&:empty?).join(',')
          values = "''" if values.empty?

          super(field, :in, values)
        end
      end
    end
  end
end
