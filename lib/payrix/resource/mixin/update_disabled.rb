module Payrix
  module Resource
    module Mixin
      module UpdateDisabled
        def update(params = {})
          raise Payrix::Exceptions::InvalidRequest.new('Invalid Action')
        end
      end
    end
  end
end