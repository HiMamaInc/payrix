# frozen_string_literal: true

module Payrix
  class FundOrigin < BaseResource
    RESOURCE_ENDPOINT = 'fundOrigins'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
