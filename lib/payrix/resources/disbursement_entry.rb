# frozen_string_literal: true

module Payrix
  class DisbursementEntry < BaseResource
    RESOURCE_ENDPOINT = 'disbursementEntries'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
  end
end
