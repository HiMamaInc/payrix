# frozen_string_literal: true

module Payrix
  class AccountVerification < BaseResource
    RESOURCE_ENDPOINT = 'accountVerifications'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
