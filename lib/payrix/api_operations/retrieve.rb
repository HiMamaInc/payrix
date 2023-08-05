# frozen_string_literal: true

module Payrix
  module APIOperations
    module Retrieve
      def retrieve(id, options = {})
        raise ArgumentError, "#{self}.retrieve takes a string argument" unless id.is_a?(String)

        response = Payrix::Util.get(klass: self, filters: { id: id }, options: options)

        if response.data.first.nil?
          raise(
            Payrix::Exceptions::ResourceNotFound,
            "Couldn't find #{self} with id='#{id}'",
          )
        end

        Payrix::Object.instantiate_from(response.data.first)
      end
    end
  end
end
