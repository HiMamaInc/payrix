# frozen_string_literal: true

module Payrix
  class PendingEntry < BaseResource
    RESOURCE_ENDPOINT = 'pendingEntries'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
