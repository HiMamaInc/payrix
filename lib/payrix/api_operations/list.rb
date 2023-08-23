# frozen_string_literal: true

module Payrix
  module APIOperations
    # Extending your class with this module gives you a method to enable sending GET requests to the Payrix API for a
    # collection of records.
    module List
      def list(filters = {}, options = {})
        Payrix::List.new(klass: self, filters: filters, options: options)
      end
    end
  end
end
