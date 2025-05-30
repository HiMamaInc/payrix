# frozen_string_literal: true

require 'json'

require 'payrix/version'
require 'payrix/configuration'
require 'payrix/exceptions'
require 'payrix/http'
require 'payrix/client'
require 'payrix/util'
require 'payrix/object'
require 'payrix/list'
require 'payrix/request_options'
require 'payrix/search'
require 'payrix/errors'
require 'payrix/api_operations'
require 'payrix/base_resource'
require 'payrix/resources'

# The Payrix API.
module Payrix
  ENVIRONMENTS = {
    sandbox: :sandbox,
    production: :production,
  }.freeze

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.api_key=(api_key)
    configuration.api_key = api_key
  end

  def self.environment=(environment)
    configuration.environment = environment
  end

  def self.configure
    yield(configuration)
  end
end
