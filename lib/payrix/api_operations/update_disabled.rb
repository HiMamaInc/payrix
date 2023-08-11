# frozen_string_literal: true

module Payrix
  module APIOperations
    module UpdateDisabled
      def update(*)
        raise NotSupportedError, "#{self}.update is not supported"
      end
    end
  end
end
