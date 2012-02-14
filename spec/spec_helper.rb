$:.unshift File.expand_path('../lib', File.dirname(__FILE__))

require 'statraptor'
require 'rspec'
require 'factory_girl'
require 'factories'

RSpec.configure do |config|
  config.filter_run :focused => true
  config.run_all_when_everything_filtered = true
  config.alias_example_to :fit, :focused => true
  config.color_enabled = true
end
