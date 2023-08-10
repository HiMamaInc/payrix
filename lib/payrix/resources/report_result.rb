# frozen_string_literal: true

module Payrix
  class ReportResult < BaseResource
    RESOURCE_ENDPOINT = 'reportResults'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
