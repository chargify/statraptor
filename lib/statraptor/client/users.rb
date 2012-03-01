module StatRaptor
  class Client
    module Users
      def create_user(params = {})
        post("/api/v1/users.json", :user => params)
      end

      def delete_user(user_credentials)
        delete("/api/v1/users/#{user_credentials}.json")
      end

      def get_users
        get("/api/v1/users.json")
      end

      def find_or_create_user(params = {})
        users = get_users
        user = users.detect{|u| (u['email'] == params[:email]) && (u['chargify_api_key'] == params[:chargify_api_key])}
        !!user ? user : create_user(params)
      end

      # This StatRaptor API endpoint isn't available yet
      def get_user(user_credentials)
        raise NotImplementedError
        get("/api/v1/users/#{user_credentials}.json")
      end
    end
  end
end
