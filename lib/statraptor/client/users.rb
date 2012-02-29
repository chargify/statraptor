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
    end
  end
end
