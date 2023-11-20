# frozen_string_literal: true

module Payrix
  class PaymentUpdate < BaseResource
    RESOURCE_ENDPOINT = 'paymentUpdates'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
