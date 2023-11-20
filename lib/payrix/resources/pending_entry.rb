# frozen_string_literal: true

module Payrix
  class PendingEntry < BaseResource
    RESOURCE_ENDPOINT = 'pendingEntries'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
