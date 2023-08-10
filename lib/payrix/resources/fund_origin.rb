# frozen_string_literal: true

module Payrix
  class FundOrigin < BaseResource
    RESOURCE_ENDPOINT = 'fundOrigins'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
