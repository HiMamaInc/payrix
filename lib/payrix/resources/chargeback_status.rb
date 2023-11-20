# frozen_string_literal: true

module Payrix
  class ChargebackStatus < BaseResource
    RESOURCE_ENDPOINT = 'chargebackStatuses'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
