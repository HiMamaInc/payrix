# frozen_string_literal: true

module Payrix
  module RequestOptions
    module Paginate
      # A builder class that constructs a valid URL query parameter to be used for limiting the result set of a
      # paginated query (.list).
      class Limit
        def self.construct(limit)
          return '' if limit.nil?

          if !limit.is_a?(Integer) || limit < 1 || limit > 100
            raise ArgumentError, 'Limit option must be an integer between 1 and 100 (inclusive)'
          end

          "page[limit]=#{limit}&"
        end
      end
    end
  end
end
