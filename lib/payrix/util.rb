# frozen_string_literal: true

module Payrix
  module Util
    def self.camel_case(string)
      string.split('_').inject { |part1, part2| part1 + part2.capitalize }
    end

    def self.snake_case(string)
      string.gsub(/(.)([A-Z])/, '\1_\2').downcase
    end

    def self.recursive_snake_case(object)
      case object
      when Hash
        object.each_with_object({}) do |(key, value), hash|
          hash[snake_case(key.to_s)] = recursive_snake_case(value)
        end
      when Array
        object.map do |item|
          recursive_snake_case(item)
        end
      else
        object
      end
    end

    def self.recursive_camel_case(object)
      case object
      when Hash
        object.each_with_object({}) do |(key, value), hash|
          hash[camel_case(key.to_s)] = recursive_camel_case(value)
        end
      when Array
        object.map do |item|
          recursive_camel_case(item)
        end
      else
        object
      end
    end
  end
end
