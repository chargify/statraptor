require 'spec_helper'

describe StatRaptor::Client::Projects do
  let(:client) { StatRaptor::Client.new }

  context "#create_project", :vcr do
    before do
      @user = client.create_user(:email => random_email, :chargify_api_key => "ABC123")
      @user["user_credentials"].should_not be_nil
    end

    it "returns a project hash on success" do
      project = client.create_project(:user_credentials => @user["user_credentials"], :project => {
       :name => "Zippy Sunday", :subdomain => "zippy-sunday", :component => "basic" 
      })

      project["name"].should == "Zippy Sunday"
      project["subdomain"].should == "zippy-sunday"
      project["component"].should == "basic"
    end
  end

  context "#delete_project", :vcr do
    it "returns the project hash on success" do
      user = client.create_user(:email => random_email, :chargify_api_key => "ABC123")
      project = client.create_project(:user_credentials => user["user_credentials"], :project => {
       :name => "Modern Marvels", :subdomain => "modern-marvels", :component => "advanced" 
      })

      deleted_project = client.delete_project(:user_credentials => user["user_credentials"], :subdomain => "modern-marvels")
      deleted_project["name"].should == "Modern Marvels"
      deleted_project["subdomain"].should == "modern-marvels"
      deleted_project["component"].should == "advanced"
    end

    it "raises an unauthorized exception if the user credentials are incorrect" do
      lambda {
        client.delete_project(:user_credentials => "abc123", :subdomain => "modern-marvels")
      }.should raise_error(StatRaptor::Error::Unauthorized, "Invalid user API key specified")
    end

    it "allows re-creating a deleted project" do
      # Set up a user and project
      user = client.create_user(:email => random_email, :chargify_api_key => "ABC123")
      project = client.create_project(:user_credentials => user["user_credentials"], :project => {
       :name => "Modern Marvels", :subdomain => "modern-marvels", :component => "advanced" 
      })

      # Delete the project
      client.delete_project(:user_credentials => user["user_credentials"], :subdomain => "modern-marvels")

      # Recreate the project
      lambda {
        project = client.create_project(:user_credentials => user["user_credentials"], :project => {
         :name => "Modern Marvels", :subdomain => "modern-marvels", :component => "advanced" 
        })
      }.should_not raise_error(StatRaptor::Error, "Subdomain has already been taken")
    end

    it "allows deleting and re-creating a project multiple times" do
      # Set up a user and project
      user = client.create_user(:email => random_email, :chargify_api_key => "ABC123")

      # Create project once
      project = client.create_project(:user_credentials => user["user_credentials"], :project => {
       :name => "Modern Marvels", :subdomain => "modern-marvels", :component => "advanced"
      })

      # Delete project
      client.delete_project(:user_credentials => user["user_credentials"], :subdomain => "modern-marvels")

      # Create project for the second time
      project = client.create_project(:user_credentials => user["user_credentials"], :project => {
       :name => "Modern Marvels", :subdomain => "modern-marvels", :component => "advanced"
      })

      # Delete the project
      client.delete_project(:user_credentials => user["user_credentials"], :subdomain => "modern-marvels")

      # Create project for the third time
      lambda {
        project = client.create_project(:user_credentials => user["user_credentials"], :project => {
         :name => "Modern Marvels", :subdomain => "modern-marvels", :component => "advanced"
        })
      }.should_not raise_error(StatRaptor::Error, "Subdomain has already been taken")
    end
  end
end
