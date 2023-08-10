# frozen_string_literal: true

module Payrix
  class EntityDebt < BaseResource
    RESOURCE_ENDPOINT = 'entityDebts'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
