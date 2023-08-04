module Payrix
  module APIOperations
    module Retrieve
      def retrieve(id, options = {})
        if !id.is_a?(String)
          raise Payrix::Exceptions::ResourceNotFound, "Couldn't find #{self} without ID"
        end

        response = Payrix::Util.get(klass: self, filters: { id: id }, options: options)

        if response.data.first.nil?
          raise Payrix::Exceptions::ResourceNotFound, "Couldn't find #{self} with id='#{id}'"
        end

        Payrix::Util.instantiate_object(response.data.first, self.to_s.gsub('Payrix::', ''))
      end
    end
  end
end
