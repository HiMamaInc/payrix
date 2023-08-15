# frozen_string_literal: true

module Payrix
  module APIOperations
    # Extending your class with this module disables the .create method.
    module CreateDisabled
      def create(*)
        raise NotSupportedError, "#{self}.create is not supported"
      end
    end
  end
end
