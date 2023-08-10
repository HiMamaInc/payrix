# frozen_string_literal: true

module Payrix
  class Fund < BaseResource
    RESOURCE_ENDPOINT = 'funds'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
  end
end
