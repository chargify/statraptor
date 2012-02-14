require 'spec_helper'

describe StatRaptor::Client::Users do
  context "#create", :vcr do
    it "returns the user json on success" do
      client = StatRaptor::Client.new
      user = client.create_user(:email => "luke.skywalker@example.com", :chargify_api_key => chargify_api_key)
      response_hash = {
        :first_name => nil, 
        :last_name => nil, 
        :email => "luke.skywalker@example.com", 
        :phone_number => nil, 
        :chargify_api_key => chargify_api_key, 
        :user_credentials => "Mtmb6a1cHo5iEiz7X5U"
      }
      user.should == response_hash.to_json
    end

    it "raises an exception if the user was not created"
  end

  context "#delete_user" do
    it "returns true on success"
    it "raises an exception if the user was not deleted"
  end
end
