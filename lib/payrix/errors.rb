# frozen_string_literal: true

module Payrix
  class Error < StandardError
  end

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

  class NotSupportedError < Error
  end
end
