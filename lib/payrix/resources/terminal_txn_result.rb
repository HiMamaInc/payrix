# frozen_string_literal: true

module Payrix
  class TerminalTxnResult < BaseResource
    RESOURCE_ENDPOINT = 'terminalTxnResults'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
  end
end
