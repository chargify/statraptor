require 'spec_helper'

describe StatRaptor::Client::Users do
  context "#create", :vcr do
    it "returns the user json on success" do
      client = StatRaptor::Client.new
      user_json = client.create_user(:email => "timmy@example.com", :chargify_api_key => chargify_api_key)
      user_hash = JSON.parse(user_json)
      user_hash["user_credentials"].should_not be_nil
      user_hash["chargify_api_key"].should == chargify_api_key
      user_hash["email"].should == "timmy@example.com"
    end

    it "raises an exception if the user was not created"
  end

  context "#delete_user" do
    it "returns true on success"
    it "raises an exception if the user was not deleted"
  end
end
