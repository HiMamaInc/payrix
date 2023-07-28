module Payrix
  class Entity < BaseResource
    RESOURCE_ENDPOINT = 'entities'

    nested_collection(:org_entities, 'OrgEntity')
  end
end
