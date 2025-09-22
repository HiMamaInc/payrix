# frozen_string_literal: true

module Payrix
  # Use this class to configure API parameters such as API URL, API key, etc.
  class Configuration
    attr_accessor :api_key, :session_key
    attr_reader :region, :environment

    def initialize
      @api_key = ''
      @session_key = ''
      @region = nil
      @environment = Payrix::ENVIRONMENTS.fetch(:sandbox)
    end

    def region=(region)
      validate_region!(region)

      @region = region.to_sym
    end

    def environment=(environment)
      validate_environment!(environment)

      @environment = environment.to_sym
    end

    def url(region_override = nil, environment_override = nil)
      region = region_override || @region
      environment = environment_override || @environment

      validate_region!(region)
      validate_environment!(environment)

      Payrix::ENDPOINTS[region.to_sym][environment.to_sym]
    end

    private

    def validate_environment!(environment)
      raise InvalidEnvironmentError unless environment.respond_to?(:to_sym)
      raise InvalidEnvironmentError unless Payrix::ENVIRONMENTS.values.include?(environment.to_sym)
    end

    def validate_region!(region)
      raise InvalidRegionError unless region.respond_to?(:to_sym)
      raise InvalidRegionError unless Payrix::REGIONS.values.include?(region.to_sym)
    end
  end
end
