module Payrix
  class Merchant < BaseResource
    RESOURCE_ENDPOINT = 'merchants'

    nested_object(:entity, 'Entity')
  end
end
