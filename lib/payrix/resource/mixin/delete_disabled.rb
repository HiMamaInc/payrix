module Payrix
  module Resource
    module Mixin
      module DeleteDisabled
        def delete(params = {})
          raise Payrix::Exceptions::InvalidRequest.new('Invalid Action')
        end
      end
    end
  end
end
