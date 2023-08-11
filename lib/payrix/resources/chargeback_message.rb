# frozen_string_literal: true

module Payrix
  class ChargebackMessage < BaseResource
    RESOURCE_ENDPOINT = 'chargebackMessages'

    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
