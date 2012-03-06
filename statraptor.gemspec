# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'statraptor/version'

Gem::Specification.new do |s|
  s.name        = "statraptor"
  s.version     = StatRaptor::VERSION
  s.platform    = Gem::Platform::RUBY
  s.date        = "2012-03-06"
  s.authors     = ["Shay Frendt"]
  s.email       = "shay.frendt@gmail.com"
  s.homepage    = "http://github.com/chargify/statraptor"
  s.summary     = "A StatRaptor API wrapper for Ruby"
  s.description = "StatRaptor gathers all your metrics into one simple-to-use dashboard."

  s.required_rubygems_version = ">= 1.3.6"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib']

  # Runtime Dependencies
  s.add_runtime_dependency('activeresource', '>= 2.3.5')
  s.add_runtime_dependency('json', '>= 1.4.6')
  s.add_runtime_dependency('rest-client', '>= 1.6.6')

  # Development Dependencies
  s.add_development_dependency('rake', '~> 0.9.2')
  s.add_development_dependency('rspec', '~> 2.8.0')
  s.add_development_dependency('vcr', '2.0.0.rc1')
  s.add_development_dependency('webmock', '1.7.10')
  s.add_development_dependency('guard-rspec', '~> 0.6.0')
  s.add_development_dependency('growl', '~> 1.0.3')
  s.add_development_dependency('rb-fsevent', '~> 0.9.0')
  s.add_development_dependency('uuid', '~> 2.3.5')
end
