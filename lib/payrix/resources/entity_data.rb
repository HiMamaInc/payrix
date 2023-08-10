# frozen_string_literal: true

module Payrix
  class EntityData < BaseResource
    RESOURCE_ENDPOINT = 'entityDatas'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
