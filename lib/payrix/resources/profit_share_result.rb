# frozen_string_literal: true

module Payrix
  class ProfitShareResult < BaseResource
    RESOURCE_ENDPOINT = 'profitShareResults'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
