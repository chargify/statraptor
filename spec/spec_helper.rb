$:.unshift File.expand_path('../lib', File.dirname(__FILE__))

require 'statraptor'
require 'rspec'
require 'vcr'
require 'fakeweb'
require 'yaml'

unless File.exists?(File.join(File.dirname(__FILE__), 'remote.yml'))
  STDERR.puts "\nERROR: Make sure a remote.yml file exists at ./spec/remote.yml\n\n"
  abort
end

RSpec.configure do |config|
  config.filter_run :focused => true
  config.run_all_when_everything_filtered = true
  config.alias_example_to :fit, :focused => true
  config.color_enabled = true

  # so we can use `:vcr` rathaner than `:vcr => true`;
  # in RSpec 3 this will no longer be necessary.
  config.treat_symbols_as_metadata_keys_with_true_values = true

  config.before(:all) do
    StatRaptor.configure do |config|
      config.platform_credentials = platform_credentials
    end
  end
end

VCR.configure do |config|
  config.hook_into :fakeweb
  config.cassette_library_dir = 'spec/cassettes'
  config.configure_rspec_metadata!
  config.default_cassette_options = { :record => :once, :match_requests_on => [:uri, :body, :headers]}
end

def platform_credentials
  remote_configuration["platform_credentials"]
end

def chargify_api_key
  remote_configuration["chargify_api_key"]
end

def chargify_subdomain
  remote_configuration["subdomain"]
end

private

def remote_configuration
  @remote_configuration ||= YAML.load_file(File.expand_path(File.join(File.dirname(__FILE__), 'remote.yml')))
end
