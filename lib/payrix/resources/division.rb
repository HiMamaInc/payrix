# frozen_string_literal: true

module Payrix
  class Division < BaseResource
    RESOURCE_ENDPOINT = 'divisions'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
