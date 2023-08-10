# frozen_string_literal: true

module Payrix
  class MerchantResult < BaseResource
    RESOURCE_ENDPOINT = 'merchantResults'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
