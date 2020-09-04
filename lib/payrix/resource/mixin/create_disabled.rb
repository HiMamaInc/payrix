module Payrix
  module Resource
    module Mixin
      module CreateDisabled
        def create(params = {})
          raise Payrix::Exceptions::InvalidRequest.new('Invalid Action')
        end
      end
    end
  end
end
