# frozen_string_literal: true

module Payrix
  class EntityReturn < BaseResource
    RESOURCE_ENDPOINT = 'entityReturns'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
