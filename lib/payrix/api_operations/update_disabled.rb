# frozen_string_literal: true

module Payrix
  module APIOperations
    # Extending your class with this module disables the .update method.
    module UpdateDisabled
      def update(*)
        raise NotSupportedError, "#{self}.update is not supported"
      end
    end
  end
end
