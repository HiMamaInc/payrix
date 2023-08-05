require 'uri'

module Payrix
  class Configuration
    attr_reader :url
    attr_accessor :api_key, :session_key

    def initialize
      @url = 'https://api.payrix.com'
      @api_key = ''
      @session_key = ''
    end

    def set_test_mode(test)
      host = URI.parse(url).host

      if test == true
        if !host.start_with?('test-')
          @url = "https://test-#{host}"
        end
      else
        if host.start_with?('test-')
          @url = "https://#{host[5..-1]}"
        end
      end
    end
  end
end
