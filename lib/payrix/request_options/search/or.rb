# frozen_string_literal: true

module Payrix
  module RequestOptions
    module Search
      class Or < Compound
        def initialize(*args)
          super(:or, *args)
        end
      end
    end
  end
end
