# frozen_string_literal: true

module Payrix
  class ReserveEntry < BaseResource
    RESOURCE_ENDPOINT = 'reserveEntries'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
