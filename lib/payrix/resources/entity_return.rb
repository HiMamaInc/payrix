# frozen_string_literal: true

module Payrix
  class EntityReturn < BaseResource
    RESOURCE_ENDPOINT = 'entityReturns'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
