require 'spec_helper'

describe StatRaptor::Client::Users do
  let(:client) { StatRaptor::Client.new }

  describe "#create_user", :vcr do
    it "returns a user hash on success" do
      email = random_email
      user = client.create_user(:email => email, :chargify_api_key => "ABC123")
      user["user_credentials"].should_not be_nil
      user["chargify_api_key"].should == "ABC123"
      user["email"].should == email
    end
  end

  describe "#delete_user", :vcr do
    it "returns the user hash on success" do
      email = random_email
      user = client.create_user(:email => email, :chargify_api_key => "XYZ123")
      deleted_user = client.delete_user(user["user_credentials"])
      deleted_user["user_credentials"].should == user["user_credentials"]
      deleted_user["chargify_api_key"].should == "XYZ123"
      deleted_user["email"].should == email
    end
  end

  describe "#get_users", :vcr do
    it "returns an array of hashes" do
      users = client.get_users
      users.count.should > 1
      users.should be_a(Array)
      users.first.should be_a(Hash)
    end
  end

  describe "#find_or_create_user" do
    it "returns the user hash if the user already exists" do
      email = random_email
      user = client.create_user(:email => email, :chargify_api_key => "ABCDEF")

      lambda {
        @user = client.find_or_create_user(:email => email, :chargify_api_key => "ABCDEF")
      }.should_not raise_error(StatRaptor::Error)

      @user['user_credentials'].should == user['user_credentials']
      @user['chargify_api_key'].should == user['chargify_api_key']
      @user['email'].should == user['email']
    end

    it "creates a new user if the user does not exist" do
      email = random_email
      user = client.find_or_create_user(:email => email, :chargify_api_key => "123456")
      user["user_credentials"].should_not be_nil
      user['chargify_api_key'].should == "123456"
      user['email'].should == email
    end
  end
end
