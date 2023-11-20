# frozen_string_literal: true

module Payrix
  class ReportResult < BaseResource
    RESOURCE_ENDPOINT = 'reportResults'

    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
