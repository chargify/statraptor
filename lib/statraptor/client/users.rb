module StatRaptor
  class Client
    module Users
      def create_user(params={})
        response = Typhoeus::Request.post("#{StatRaptor.endpoint}/users", :params => {:platform_credentials => StatRaptor.platform_credentials, :user => params })
        response.body
      end

      def delete_user(params={})
      end
    end
  end
end
