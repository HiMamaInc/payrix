# frozen_string_literal: true

module Payrix
  module APIOperations
    module DeleteDisabled
      def delete(*)
        raise NotSupportedError, "#{self}.delete is not supported"
      end
    end
  end
end
