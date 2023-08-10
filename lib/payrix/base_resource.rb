# frozen_string_literal: true

module Payrix
  class BaseResource
    extend Payrix::APIOperations::Retrieve
    extend Payrix::APIOperations::Delete
    extend Payrix::APIOperations::List
  end
end
