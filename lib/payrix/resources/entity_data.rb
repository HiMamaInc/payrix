# frozen_string_literal: true

module Payrix
  class EntityData < BaseResource
    RESOURCE_ENDPOINT = 'entityDatas'

    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
