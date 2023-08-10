# frozen_string_literal: true

module Payrix
  class Assessment < BaseResource
    RESOURCE_ENDPOINT = 'assessments'

    extend Payrix::APIOperations::CreateDisabled
    extend Payrix::APIOperations::DeleteDisabled
  end
end
