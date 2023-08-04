module Payrix
  class Merchant < BaseResource
    RESOURCE_ENDPOINT = 'merchants'

    STATUS_NOT_READY = 0
    STATUS_READY = 1
    STATUS_BOARDED = 2
    STATUS_MANUAL = 3
    STATUS_CLOSED = 4
    STATUS_INCOMPLETE = 5
    STATUS_PENDING = 6
  end
end
