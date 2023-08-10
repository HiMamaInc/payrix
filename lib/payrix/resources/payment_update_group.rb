# frozen_string_literal: true

module Payrix
  class PaymentUpdateGroup < BaseResource
    RESOURCE_ENDPOINT = 'paymentUpdateGroups'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
  end
end
