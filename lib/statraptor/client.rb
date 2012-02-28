require 'statraptor/config'
require 'statraptor/error'
require 'statraptor/error/not_found'
require 'statraptor/error/unauthorized'

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

    private

    def get(url, params = {})
      request_and_parse :get, url, params
    end

    def post(url, params = {})
      request_and_parse :post, url, params
    end

    def put(url, params = {})
      request_and_parse :put, url, params
    end

    def delete(url, params = {})
      request_and_parse :delete, url, params
    end

    def request_and_parse(method, url, params = {})
      response = request_api_response(method, url, params)
      handle_response(response)
      parse_response(response)
    end

    def request_api_response(method, url, params = {})
      params.merge!(:platform_credentials => StatRaptor.platform_credentials)

      Typhoeus::Request.run(
        "#{StatRaptor.endpoint}/api/v1#{url}",
        :method => method,
        :params => params,
        :disable_ssl_peer_verification => StatRaptor.disable_ssl_peer_verification,
        :timeout => StatRaptor.timeout
      )
    end

    def parse_response(response)
      JSON.parse(response.body)
    rescue JSON::ParserError
      {}
    end

    def handle_response(response)
      case response.code
      when 200
        return true
      when 404
        raise StatRaptor::Error::NotFound.new(format_error(response))
      when 401
        raise StatRaptor::Error::Unauthorized.new(format_error(response))
      else
        raise StatRaptor::Error.new(format_error(response))
      end
    end

    def format_error(response)
      parsed_response = parse_response(response)
      parsed_response["errors"] ? parsed_response["errors"].join(", ") : ''
    end

  end
end
