# frozen_string_literal: true

require 'payrix/request_options/paginate/limit'

module Payrix
  module RequestOptions
    module Paginate
      def self.construct(page)
        "page[number]=#{page}&"
      end
    end
  end
end
