# frozen_string_literal: true

module Payrix
  class Refund < BaseResource
    RESOURCE_ENDPOINT = 'refunds'

    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
