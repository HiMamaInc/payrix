# frozen_string_literal: true
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "payrix/version"

Gem::Specification.new do |spec|
  spec.name          = "payrix"
  spec.version       = Payrix::VERSION
  spec.licenses      = ['Apache-2.0']
  spec.summary       = %q{Ruby bindings for the Payrix API}
  spec.description   = %q{Defines ruby classes for the Payrix API}
  spec.homepage      = "https://portal.payrix.com/docs/api"
  spec.author        = "Payrix"
  spec.files         = Dir['lib/**/*.rb']
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday", "~> 2.0.1"
  spec.add_runtime_dependency "faraday-follow_redirects"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rubocop'
end
