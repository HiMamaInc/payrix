# frozen_string_literal: true

module Payrix
  class EntryOrigin < BaseResource
    RESOURCE_ENDPOINT = 'entryOrigins'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
