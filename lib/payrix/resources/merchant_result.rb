# frozen_string_literal: true

module Payrix
  class MerchantResult < BaseResource
    RESOURCE_ENDPOINT = 'merchantResults'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
