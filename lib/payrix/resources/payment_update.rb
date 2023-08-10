# frozen_string_literal: true

module Payrix
  class PaymentUpdate < BaseResource
    RESOURCE_ENDPOINT = 'paymentUpdates'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
