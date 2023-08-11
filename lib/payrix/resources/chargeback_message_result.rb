# frozen_string_literal: true

module Payrix
  class ChargebackMessageResult < BaseResource
    RESOURCE_ENDPOINT = 'chargebackMessageResults'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
