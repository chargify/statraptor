require 'spec_helper'

describe StatRaptor do
  after do
    StatRaptor.reset
  end

  describe ".endpoint" do
    it "should return the default endpoint" do
      StatRaptor.endpoint.should == StatRaptor::Config::DEFAULT_ENDPOINT
    end
  end

  describe ".endpoint=" do
    it "should set the endpoint" do
      StatRaptor.endpoint = 'http://example.com/'
      StatRaptor.endpoint.should == 'http://example.com/'
    end
  end

  describe ".user_agent" do
    it "should return the default user agent" do
      StatRaptor.user_agent.should == StatRaptor::Config::DEFAULT_USER_AGENT
    end
  end

  describe ".user_agent=" do
    it "should set the user_agent" do
      StatRaptor.user_agent = 'Custom User Agent'
      StatRaptor.user_agent.should == 'Custom User Agent'
    end
  end

  describe ".platform_credentials=" do
    it "should set the platform_credentials" do
      StatRaptor.platform_credentials = "ABC123"
      StatRaptor.platform_credentials.should == "ABC123"
    end
  end

  describe ".configure" do
    it "sets the site on the base class" do
      StatRaptor.configure do |config|
        config.endpoint = "http://example.com/api/v1"
      end

      StatRaptor::Base.site.to_s.should == "http://example.com/api/v1"
    end

    it "sets the timeout on the base class" do
      StatRaptor.configure do |config|
        config.timeout = 5
      end

      StatRaptor::Base.timeout.should == 5
    end
  end

end
