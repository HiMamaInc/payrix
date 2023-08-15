# frozen_string_literal: true

module Payrix
  module APIOperations
    # Extending your class with this module disables the .delete method.
    module DeleteDisabled
      def delete(*)
        raise NotSupportedError, "#{self}.delete is not supported"
      end
    end
  end
end
