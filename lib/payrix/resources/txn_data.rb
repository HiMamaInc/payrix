# frozen_string_literal: true

module Payrix
  class TxnData < BaseResource
    RESOURCE_ENDPOINT = 'txnDatas'

    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
