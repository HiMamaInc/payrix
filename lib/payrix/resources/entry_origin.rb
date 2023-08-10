# frozen_string_literal: true

module Payrix
  class EntryOrigin < BaseResource
    RESOURCE_ENDPOINT = 'entryOrigins'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
