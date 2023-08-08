# frozen_string_literal: true

module Payrix
  module RequestOptions
    module Paginate
      def self.construct(page)
        "page[number]=#{page}&"
      end
    end
  end
end
