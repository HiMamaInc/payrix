# frozen_string_literal: true

module Payrix
  class TxnMetadata < BaseResource
    RESOURCE_ENDPOINT = 'txnMetadatas'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
  end
end
