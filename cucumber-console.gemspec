# encoding: utf-8
$:.unshift File.expand_path("../lib", __FILE__)
$:.unshift File.expand_path("../../lib", __FILE__)

require 'cucumber-console/version'

Gem::Specification.new do |s|
  s.name        = "cucumber-console"
  s.version     = CucumberConsole::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nicolas Viennot"]
  s.email       = ["nicolas@viennot.biz"]
  s.homepage    = "http://github.com/nviennot/cucumber-console"
  s.summary     = "Run Cucumber tests in your console"
  s.description = "Run Cucumber tests in your console"

  s.add_dependency 'cucumber'
  s.add_dependency 'rails-env-switcher'

  s.files        = Dir["lib/**/*"] + ['README.md']
  s.require_path = 'lib'
  s.has_rdoc     = false
end
