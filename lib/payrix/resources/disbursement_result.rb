# frozen_string_literal: true

module Payrix
  class DisbursementResult < BaseResource
    RESOURCE_ENDPOINT = 'disbursementResults'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
  end
end
