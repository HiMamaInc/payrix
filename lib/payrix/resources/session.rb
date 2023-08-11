# frozen_string_literal: true

module Payrix
  class Session < BaseResource
    RESOURCE_ENDPOINT = 'sessions'

    extend Payrix::APIOperations::UpdateDisabled
  end
end
