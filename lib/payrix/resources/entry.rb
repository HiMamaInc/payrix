# frozen_string_literal: true

module Payrix
  class Entry < BaseResource
    RESOURCE_ENDPOINT = 'entries'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
