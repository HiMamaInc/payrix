# frozen_string_literal: true

module Payrix
  class StatementEntry < BaseResource
    RESOURCE_ENDPOINT = 'statementEntries'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
  end
end
