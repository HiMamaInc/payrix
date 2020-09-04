require "payrix/version"
require "payrix/configuration"
require "payrix/exceptions"
require "payrix/http"
require "payrix/resource"

module Payrix
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
