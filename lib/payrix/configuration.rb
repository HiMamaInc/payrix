# frozen_string_literal: true

module Payrix
  # Use this class to configure API parameters such as API URL, API key, etc.
  class Configuration
    attr_accessor :api_key, :session_key, :environment

    def initialize
      @api_key = ''
      @session_key = ''
      @environment = Payrix::ENVIRONMENTS.fetch(:sandbox)
    end

    def url
      case @environment
      when Payrix::ENVIRONMENTS.fetch(:sandbox)
        'https://test-api.payrix.com'
      when Payrix::ENVIRONMENTS.fetch(:production)
        'https://api.payrix.com'
      end
    end
  end
end
