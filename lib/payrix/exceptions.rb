# frozen_string_literal: true

module Payrix
  module Exceptions # rubocop:disable Style/Documentation - Legacy file, which will be removed eventually
    autoload :Base, 'payrix/exceptions/base'
    autoload :ApiError, 'payrix/exceptions/api_error'
    autoload :Connection, 'payrix/exceptions/connection'
    autoload :InvalidRequest, 'payrix/exceptions/invalid_request'
    autoload :InvalidResponse, 'payrix/exceptions/invalid_response'
  end
end
