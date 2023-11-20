# frozen_string_literal: true

module Payrix
  class MessageThread < BaseResource
    RESOURCE_ENDPOINT = 'messageThreads'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
  end
end
