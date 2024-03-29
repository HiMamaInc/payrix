# frozen_string_literal: true

module Payrix
  class InvoiceResult < BaseResource
    RESOURCE_ENDPOINT = 'invoiceResults'

    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
