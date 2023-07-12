module Payrix
  class Merchant < BaseResource
    RESOURCE_ENDPOINT = 'merchants'

    define_expansion(:entity, Payrix::Entity)
  end
end
