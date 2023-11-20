# frozen_string_literal: true

module Payrix
  class TerminalTxnMetadata < BaseResource
    RESOURCE_ENDPOINT = 'terminalTxnMetadatas'

    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
