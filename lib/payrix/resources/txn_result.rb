# frozen_string_literal: true

module Payrix
  class TxnResult < BaseResource
    RESOURCE_ENDPOINT = 'txnResults'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
