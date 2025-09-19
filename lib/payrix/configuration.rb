# frozen_string_literal: true

module Payrix
  # Use this class to configure API parameters such as API URL, API key, etc.
  class Configuration
    attr_accessor :api_key, :session_key
    attr_reader :environment

    def initialize
      @api_key = ''
      @session_key = ''
      @environment = Payrix::ENVIRONMENTS.fetch(:sandbox)
    end

    def environment=(environment)
      validate_environment!(environment)

      @environment = environment.to_sym
    end

    def url(environment_override = nil)
      environment = environment_override || @environment

      validate_environment!(environment)

      case environment.to_sym
      when Payrix::ENVIRONMENTS.fetch(:sandbox)
        'https://test-api.payrix.com'
      when Payrix::ENVIRONMENTS.fetch(:production)
        'https://api.payrix.com'
      end
    end

    private

    def validate_environment!(environment)
      raise InvalidEnvironmentError unless environment.respond_to?(:to_sym)
      raise InvalidEnvironmentError unless Payrix::ENVIRONMENTS.values.include?(environment.to_sym)
    end
  end
end
