# frozen_string_literal: true

module Payrix
  class Adjustment < BaseResource
    RESOURCE_ENDPOINT = 'adjustments'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
