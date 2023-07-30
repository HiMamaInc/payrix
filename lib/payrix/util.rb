module Payrix
  module Util
    def self.camel_case(string)
      string.split('_').inject { |m, p| m + p.capitalize }
    end

    def self.snake_case(string)
      string.gsub(/(.)([A-Z])/, '\1_\2').downcase
    end
  end
end
