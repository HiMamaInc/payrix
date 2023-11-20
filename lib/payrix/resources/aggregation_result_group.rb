# frozen_string_literal: true

module Payrix
  class AggregationResultGroup < BaseResource
    RESOURCE_ENDPOINT = 'aggregationResultGroups'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
