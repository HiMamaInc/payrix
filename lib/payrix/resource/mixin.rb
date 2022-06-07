module Payrix
  module Resource
    module Mixin
      autoload :UpdateDisabled, 'payrix/resource/mixin/update_disabled'
      autoload :CreateDisabled, 'payrix/resource/mixin/create_disabled'
      autoload :DeleteDisabled, 'payrix/resource/mixin/delete_disabled'
      autoload :AttrCasters, 'payrix/resource/mixin/attr_casters'
    end
  end
end
