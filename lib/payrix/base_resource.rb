module Payrix
  class BaseResource
    attr_reader :data

    def initialize(data = {})
      @data = data
    end
  end
end
