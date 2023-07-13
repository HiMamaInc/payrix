module Payrix
  class Merchant < BaseResource
    RESOURCE_ENDPOINT = 'merchants'

    nested_object(:entity, Payrix::Entity)
  end
end
