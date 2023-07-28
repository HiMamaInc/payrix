module Payrix
  module APIOperations
    module List
      def list(filters = {}, options = {})
        Payrix::List.new(klass: self, filters: filters, options: options)
      end
    end
  end
end
