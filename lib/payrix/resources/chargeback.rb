# frozen_string_literal: true

module Payrix
  class Chargeback < BaseResource
    RESOURCE_ENDPOINT = 'chargebacks'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
