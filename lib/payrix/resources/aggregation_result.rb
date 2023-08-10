# frozen_string_literal: true

module Payrix
  class AggregationResult < BaseResource
    RESOURCE_ENDPOINT = 'aggregationResults'

    extend Payrix::APIOperations::CreateDisabled
  end
end
