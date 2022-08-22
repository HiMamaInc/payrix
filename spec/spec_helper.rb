require 'payrix'
require 'webmock/rspec'
require 'pry'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.expose_dsl_globally = false
end

Payrix.configure do |config|
  config.set_test_mode(true)
end

WebMock.disable_net_connect!(allow: 'https://test-api.payrix.com/')
