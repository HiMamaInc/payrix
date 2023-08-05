# frozen_string_literal: true

require 'uri'

module Payrix
  class Configuration
    attr_accessor :api_key, :session_key

    def initialize
      @api_key = ''
      @session_key = ''
      @test_mode = false
    end

    def set_test_mode(test_mode)
      @test_mode = test_mode
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
