# frozen_string_literal: true

module Payrix
  class BaseResource
    extend Payrix::APIOperations::Create
    extend Payrix::APIOperations::Delete
    extend Payrix::APIOperations::List
    extend Payrix::APIOperations::Retrieve
  end
end
