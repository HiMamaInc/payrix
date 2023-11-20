# frozen_string_literal: true

module Payrix
  class Message < BaseResource
    RESOURCE_ENDPOINT = 'messages'

    extend Payrix::APIOperations::DeleteDisabled
  end
end
