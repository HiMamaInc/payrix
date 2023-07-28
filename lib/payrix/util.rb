module Payrix
  module Util
    def self.camel_case(string)
      string.split('_').inject { |m, p| m + p.capitalize }
    end
  end
end
