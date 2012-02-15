require 'statraptor/error/not_found'

module StatRaptor
  class Client
    module Users
      def create_user(params={})
        response = Typhoeus::Request.post("#{StatRaptor.endpoint}/users", :params => {:platform_credentials => StatRaptor.platform_credentials, :user => params })
        response.body
      end

      def delete_user(user_credentials)
        response = Typhoeus::Request.delete("#{StatRaptor.endpoint}/users/#{user_credentials}", :params => {:platform_credentials => StatRaptor.platform_credentials})
        handle_response(response)
      end
    end
  end
end
