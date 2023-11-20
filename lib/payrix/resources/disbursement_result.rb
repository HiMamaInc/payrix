# frozen_string_literal: true

module Payrix
  class DisbursementResult < BaseResource
    RESOURCE_ENDPOINT = 'disbursementResults'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
