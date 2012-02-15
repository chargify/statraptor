require 'statraptor/version'

module StatRaptor
  # Defines constants and methods related to configuration
  module Config

    # The endpoint that will be used to connect if none is set
    DEFAULT_ENDPOINT = "https://statraptor.com/api/v1"

    # The value sent in the 'User-Agent' header if none is set
    DEFAULT_USER_AGENT = "StatRaptor Ruby Gem #{StatRaptor::VERSION}"

    # The timeout in seconds that will be used if none is set
    DEFAULT_TIMEOUT = 2

    # The default platform_credentials if none are set
    DEFAULT_PLATFORM_CREDENTIALS = nil

    # An array of valid keys in the options hash when configuring a {StatRaptor::Client}
    VALID_OPTIONS_KEYS = [
      :endpoint,
      :user_agent,
      :timeout,
      :platform_credentials
    ]

    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
      self
    end

    # Create a hash of options and their values
    def options
      options = {}
      VALID_OPTIONS_KEYS.each{|k| options[k] = send(k)}
      options
    end

    # Reset all configuration options to defaults
    def reset
      self.endpoint             = DEFAULT_ENDPOINT
      self.user_agent           = DEFAULT_USER_AGENT
      self.timeout              = DEFAULT_TIMEOUT
      self.platform_credentials = DEFAULT_PLATFORM_CREDENTIALS
      self
    end
  end
end