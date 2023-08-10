# frozen_string_literal: true

module Payrix
  class Error < StandardError
  end

  class ApiError < Error
    attr_reader :object, :errors

    def initialize(message = nil, object = {}, errors = [])
      @message = message
      @object = Object.instantiate_from(object)
      @errors = Object.instantiate_from(errors)

      super(message)
    end
  end

  class NotSupportedError < Error
  end
end
