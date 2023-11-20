# frozen_string_literal: true

module Payrix
  class Vendor < BaseResource
    RESOURCE_ENDPOINT = 'vendors'

    extend Payrix::APIOperations::CreateDisabled
  end
end
