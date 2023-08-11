# frozen_string_literal: true

module Payrix
  class Chargeback < BaseResource
    RESOURCE_ENDPOINT = 'chargebacks'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
