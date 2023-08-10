# frozen_string_literal: true

module Payrix
  module APIOperations
    module CreateDisabled
      def create(*)
        raise NotSupportedError, "#{self}.create is not supported"
      end
    end
  end
end
