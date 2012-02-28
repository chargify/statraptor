module StatRaptor
  class Client
    module Projects
      def create_project(params = {})
        post("/projects", params)
      end

      def delete_project(params = {})
        delete("/projects/#{params[:subdomain]}", :user_credentials => params[:user_credentials])
      end
    end
  end
end
