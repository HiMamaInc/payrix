# frozen_string_literal: true

module Payrix
  class AggregationResult < BaseResource
    RESOURCE_ENDPOINT = 'aggregationResults'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
