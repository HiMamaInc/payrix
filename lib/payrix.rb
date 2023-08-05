require 'json'

require 'payrix/version'
require 'payrix/configuration'
require 'payrix/exceptions'
require 'payrix/http'
require 'payrix/resource'
require 'payrix/util'
require 'payrix/object'
require 'payrix/list'
require 'payrix/request_options'
require 'payrix/api_operations'
require 'payrix/base_resource'
require 'payrix/resources'

module Payrix
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.api_key=(api_key)
    configuration.api_key = api_key
  end

  def self.test_mode=(test_mode)
    configuration.set_test_mode(test_mode)
  end

  def self.configure
    yield(configuration)
  end
end
