# frozen_string_literal: true

module Payrix
  class AccountVerification < BaseResource
    RESOURCE_ENDPOINT = 'accountVerifications'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
