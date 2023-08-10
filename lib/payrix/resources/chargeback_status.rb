# frozen_string_literal: true

module Payrix
  class ChargebackStatus < BaseResource
    RESOURCE_ENDPOINT = 'chargebackStatuses'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
