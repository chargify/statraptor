module StatRaptor
  class Client
    module Projects
      def create_project(params={})
        response = Typhoeus::Request.post("#{StatRaptor.endpoint}/projects", :params => {:platform_credentials => StatRaptor.platform_credentials, :user_credentials => params[:user_credentials], :project => params[:project]})
        response.body
      end

      def delete_project(params={})
        response = Typhoeus::Request.delete("#{StatRaptor.endpoint}/projects/#{params[:subdomain]}", :params => {:platform_credentials => StatRaptor.platform_credentials, :user_credentials => params[:user_credentials]})
        handle_response(response)
      end
    end
  end
end
