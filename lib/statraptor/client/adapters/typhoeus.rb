module StatRaptor
  class Client
    module Adapters
      module Typhoeus
        def self.request_api_response(method, path, params = {})
          params.merge!(:platform_credentials => StatRaptor.platform_credentials)

          ::Typhoeus::Request.run(
            "#{StatRaptor.endpoint}/api/v1#{path}",
            :method => method,
            :params => params,
            :disable_ssl_peer_verification => StatRaptor.disable_ssl_peer_verification,
            :timeout => StatRaptor.timeout
          )
        end
      end
    end
  end
end
