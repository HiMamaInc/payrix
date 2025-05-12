# frozen_string_literal: true

module Payrix
  # All library-specific errors inherit from this error class. This helps make it easy for integrations to rescue
  # specifically from errors raised by this library.
  class Error < StandardError
  end

  # A general error returned from the Payrix API. The cause could stem from multiple separate issues.
  class ApiError < Error
    attr_reader :object, :errors

    def initialize(message = nil, object = {}, errors = [])
      @message = message
      @object = Object.instantiate_from(object)
      @_errors = errors
      @errors = Object.instantiate_from(errors)

      super(
        <<~ERROR
          #{@message}

            #{JSON.pretty_generate(Payrix::Util.recursive_snake_case(errors)).gsub("\n", "\n  ")}
        ERROR
      )
    end

    def inspect
      parts = ["#<#{self.class}:#{format('0x0000%x', (object_id << 1))}"]

      parts.append(JSON.pretty_generate(Payrix::Util.recursive_snake_case(@_errors)))

      "#{parts.join(' ')}>".dup
    end
  end

  # A pre-flight error indicating the attempted operation is not supported on the given resource.
  class NotSupportedError < Error
  end

  # An error returned when the requested resource (from .retrieve) turns up empty.
  class NotFoundError < Error
  end

  # A pre-flight error indicating that the environment set is not valid.
  class InvalidEnvironmentError < Error
  end

  # An error returned when the API returns an invalid authentication error.
  class InvalidAuthenticationError < Error
  end

  # An error returned when the API rate limits the request. See https://resource.payrix.com/resources/rate-limiting for
  # more details.
  class RateLimitError < Error
  end
end
