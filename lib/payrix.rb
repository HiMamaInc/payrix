require "payrix/version"
require "payrix/configuration"
require "payrix/exceptions"
require "payrix/http"
require "payrix/resource"

require "payrix/base_resource"
require "payrix/resources/org_entity"
require "payrix/resources/entity"
require "payrix/resources/merchant"

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
