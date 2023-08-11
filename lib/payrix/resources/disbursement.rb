# frozen_string_literal: true

module Payrix
  class Disbursement < BaseResource
    RESOURCE_ENDPOINT = 'disbursements'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
