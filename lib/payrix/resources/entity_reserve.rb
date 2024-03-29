# frozen_string_literal: true

module Payrix
  class EntityReserve < BaseResource
    RESOURCE_ENDPOINT = 'entityReserves'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
