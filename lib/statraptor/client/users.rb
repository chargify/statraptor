module StatRaptor
  class Client
    module Users
      def create_user(params = {})
        post("/users.json", :user => params)
      end

      def delete_user(user_credentials)
        delete("/users/#{user_credentials}.json")
      end

      def get_users
        get("/users.json")
      end
    end
  end
end
