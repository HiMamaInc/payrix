# frozen_string_literal: true

module Payrix
  class TerminalTxnMetadata < BaseResource
    RESOURCE_ENDPOINT = 'terminalTxnMetadatas'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
