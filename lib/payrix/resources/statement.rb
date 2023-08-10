# frozen_string_literal: true

module Payrix
  class Statement < BaseResource
    RESOURCE_ENDPOINT = 'statements'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
