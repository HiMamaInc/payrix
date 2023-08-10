# frozen_string_literal: true

module Payrix
  class ProfitShareResult < BaseResource
    RESOURCE_ENDPOINT = 'profitShareResults'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
