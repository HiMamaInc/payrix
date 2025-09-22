# frozen_string_literal: true

require 'payrix'
require 'webmock/rspec'
require 'pry'

Payrix.region = :us

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.expose_dsl_globally = false
end
