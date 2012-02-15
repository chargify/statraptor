require 'spec_helper'

describe StatRaptor::Client::Users do
  let(:client) { StatRaptor::Client.new }

  context "#create", :vcr do
    it "returns the user json on success" do
      user_json = client.create_user(:email => "timmy@example.com", :chargify_api_key => chargify_api_key)
      user_hash = JSON.parse(user_json)
      user_hash["user_credentials"].should_not be_nil
      user_hash["chargify_api_key"].should == chargify_api_key
      user_hash["email"].should == "timmy@example.com"
    end

    it "raises an exception if the user was not created"
  end

  context "#delete_user", :vcr do
    it "returns true on success" do
      user_json = client.create_user(:email => "ronny@example.com", :chargify_api_key => chargify_api_key)
      user_hash = JSON.parse(user_json)
      client.delete_user(user_hash["user_credentials"]).should be_true
    end

    it "raises an NotFound exception if the user does not exist" do
      lambda {
        client.delete_user("abc123")
      }.should raise_error(StatRaptor::Error::NotFound)
    end
  end
end
