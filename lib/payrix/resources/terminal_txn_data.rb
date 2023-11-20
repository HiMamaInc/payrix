# frozen_string_literal: true

module Payrix
  class TerminalTxnData < BaseResource
    RESOURCE_ENDPOINT = 'terminalTxnDatas'

    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
