# frozen_string_literal: true

module Payrix
  class EntityDebt < BaseResource
    RESOURCE_ENDPOINT = 'entityDebts'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
