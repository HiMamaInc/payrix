# frozen_string_literal: true

module Payrix
  class TxnResult < BaseResource
    RESOURCE_ENDPOINT = 'txnResults'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
  end
end
