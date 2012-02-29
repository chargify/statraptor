require 'statraptor/version'

module StatRaptor
  # Defines constants and methods related to configuration
  # Inspired by the Twitter gem config: http://bit.ly/A2RPvv
  module Config

    # The endpoint that will be used to connect if none is set
    DEFAULT_ENDPOINT = "https://statraptor.com/api/v1"

    # The value sent in the 'User-Agent' header if none is set
    DEFAULT_USER_AGENT = "StatRaptor Ruby Gem #{StatRaptor::VERSION}"

    # The timeout (in milliseconds) that will be used if none is set
    DEFAULT_TIMEOUT = 5000 # 5 seconds

    # The default platform_credentials if none are set
    DEFAULT_PLATFORM_CREDENTIALS = nil

    # If you’re hitting a non-verifiable SSL server
    # then you’ll have to disable peer verification to make SSL work
    DEFAULT_DISABLE_SSL_PEER_VERIFICATION = false

    HTTP_HEADERS = {
      'Accept' => 'application/json',
      'User-Agent' => "StatRaptor RubyGem #{StatRaptor::VERSION} - http://github.com/chargify/statraptor",
    }

    # An array of valid keys in the options hash when configuring a {StatRaptor::Client}
    VALID_OPTIONS_KEYS = [
      :endpoint,
      :user_agent,
      :timeout,
      :platform_credentials,
      :disable_ssl_peer_verification
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
      self.endpoint                      = DEFAULT_ENDPOINT
      self.user_agent                    = DEFAULT_USER_AGENT
      self.timeout                       = DEFAULT_TIMEOUT
      self.platform_credentials          = DEFAULT_PLATFORM_CREDENTIALS
      self.disable_ssl_peer_verification = DEFAULT_DISABLE_SSL_PEER_VERIFICATION
      self
    end

    def timeout_in_seconds
      self.timeout / 1000.0
    end

    def full_uri(path)
      "#{StatRaptor.endpoint}#{path}"
    end
  end
end
