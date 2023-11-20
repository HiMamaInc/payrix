# frozen_string_literal: true

module Payrix
  class Entry < BaseResource
    RESOURCE_ENDPOINT = 'entries'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
    extend Payrix::APIOperations::UpdateDisabled
  end
end
