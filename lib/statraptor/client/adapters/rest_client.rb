module StatRaptor
  class Client
    module Adapters
      module RestClient
        def self.request_api_response(method, path, params = {})
          params.merge!(:platform_credentials => StatRaptor.platform_credentials)
          verify_ssl = StatRaptor.disable_ssl_peer_verification ? false : true
          url = StatRaptor.full_uri(path)

          options = {
            :url => url,
            :method => method,
            :payload => params,
            :verify_ssl =>  StatRaptor.disable_ssl_peer_verification,
            :timeout => StatRaptor.timeout_in_seconds,
            :headers => Config::HTTP_HEADERS
          }

          ::RestClient::Request.execute(options){|response, request, result| response }
        end
      end
    end
  end
end
