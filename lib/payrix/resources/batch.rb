# frozen_string_literal: true

module Payrix
  class Batch < BaseResource
    RESOURCE_ENDPOINT = 'batches'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
