module Payrix
  module Exceptions
    autoload :Base, 'payrix/exceptions/base'
    autoload :ApiError, 'payrix/exceptions/api_error'
    autoload :Connection, 'payrix/exceptions/connection'
    autoload :InvalidRequest, 'payrix/exceptions/invalid_request'
    autoload :InvalidResponse, 'payrix/exceptions/invalid_response'
    autoload :ResourceNotFound, 'payrix/exceptions/resource_not_found'
  end
end

