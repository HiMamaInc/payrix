require 'payrix'
require 'webmock/rspec'
require 'pry'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.expose_dsl_globally = false
end

WebMock.disable_net_connect!(allow: 'https://test-api.payrix.com/')
