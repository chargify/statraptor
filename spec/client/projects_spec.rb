require 'spec_helper'

describe StatRaptor::Client::Projects do
  let(:client) { StatRaptor::Client.new }

  context "#create_project", :vcr do
    it "returns the project json on success" do
      user_json = client.create_user(:email => "zippy@example.com", :chargify_api_key => chargify_api_key)
      user_hash = JSON.parse(user_json)

      project_json = client.create_project(:user_credentials => user_hash["user_credentials"], :project => {
       :name => "Zippy Sunday", :subdomain => "zippy-sunday", :component => "basic" 
      })

      project_hash = JSON.parse(project_json)
      project_hash["name"].should == "Zippy Sunday"
      project_hash["subdomain"].should == "zippy-sunday"
      project_hash["component"].should == "basic"
    end

    it "raises an exception if the project was not created"
  end

  context "#delete_project", :vcr do
    it "returns true on success" do
      user_json = client.create_user(:email => "sammy@example.com", :chargify_api_key => chargify_api_key)
      user_hash = JSON.parse(user_json)

      project_json = client.create_project(:user_credentials => user_hash["user_credentials"], :project => {
       :name => "Modern Marvels", :subdomain => "modern-marvels", :component => "advanced" 
      })

      client.delete_project(:user_credentials => user_hash["user_credentials"], :subdomain => "modern-marvels").should be_true
    end

    it "raises an exception if the project was not deleted" do
      lambda {
        client.delete_project(:user_credentials => "abc123", :subdomain => "modern-marvels")
      }.should raise_error(StatRaptor::Error::NotFound)
    end
  end
end
