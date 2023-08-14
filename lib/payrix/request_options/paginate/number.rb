# frozen_string_literal: true

module Payrix
  module RequestOptions
    module Paginate
      # A builder class that constructs a valid URL query parameter to be used for specifying the page to return from
      # the result set of a paginated query (.list).
      module Number
        def self.construct(number)
          return '' if number.nil?

          raise ArgumentError, 'Number option must be an integer greater than 1' if !number.is_a?(Integer) || number < 1

          "page[number]=#{number}&"
        end
      end
    end
  end
end
