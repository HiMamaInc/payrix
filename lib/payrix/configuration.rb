# frozen_string_literal: true

module Payrix
  # Use this class to configure API parameters such as API URL, API key, etc.
  class Configuration
    attr_accessor :api_key, :session_key, :test_mode

    def initialize
      @api_key = ''
      @session_key = ''
      @test_mode = false
    end

    def url
      if @test_mode
        'https://test-api.payrix.com'
      else
        'https://api.payrix.com'
      end
    end
  end
end
