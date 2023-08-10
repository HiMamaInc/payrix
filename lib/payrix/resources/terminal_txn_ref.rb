# frozen_string_literal: true

module Payrix
  class TerminalTxnRef < BaseResource
    RESOURCE_ENDPOINT = 'terminalTxnRefs'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
