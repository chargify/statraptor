require 'statraptor/config'
require 'statraptor/error'

module StatRaptor
  class Client

    require 'statraptor/client/users'
    include StatRaptor::Client::Users

    require 'statraptor/client/projects'
    include StatRaptor::Client::Projects

    require 'statraptor/client/graphs'
    include StatRaptor::Client::Graphs

    attr_accessor *Config::VALID_OPTIONS_KEYS

    # Initializes a new API object
    #
    # @param attrs [Hash]
    # @return [StatRaptor::Client]
    def initialize(attrs={})
      attrs = StatRaptor.options.merge(attrs)
      Config::VALID_OPTIONS_KEYS.each do |key|
        instance_variable_set("@#{key}".to_sym, attrs[key])
      end
    end

  end
end
