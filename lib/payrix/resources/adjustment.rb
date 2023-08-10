# frozen_string_literal: true

module Payrix
  class Adjustment < BaseResource
    RESOURCE_ENDPOINT = 'adjustments'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
