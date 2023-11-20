# frozen_string_literal: true

module Payrix
  class ConfirmCode < BaseResource
    RESOURCE_ENDPOINT = 'confirmCodes'

    extend Payrix::APIOperations::UpdateDisabled
  end
end
