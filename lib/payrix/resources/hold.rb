# frozen_string_literal: true

module Payrix
  class Hold < BaseResource
    RESOURCE_ENDPOINT = 'holds'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
