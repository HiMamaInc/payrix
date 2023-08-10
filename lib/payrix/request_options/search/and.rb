# frozen_string_literal: true

module Payrix
  module RequestOptions
    module Search
      class And < Compound
        def initialize(*args)
          super(:and, *args)
        end
      end
    end
  end
end
