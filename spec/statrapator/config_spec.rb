require 'spec_helper'

describe StatRaptor do
  before do
    StatRaptor.reset
  end

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

  describe ".platform_credentials" do
    it "should return the default platform_credentials" do
      StatRaptor.platform_credentials.should == StatRaptor::Config::DEFAULT_PLATFORM_CREDENTIALS
    end
  end

  describe ".platform_credentials=" do
    it "should set the platform_credentials" do
      StatRaptor.platform_credentials = "ABC123"
      StatRaptor.platform_credentials.should == "ABC123"
    end
  end

  describe ".timeout" do
    it "should return the default timeout" do
      StatRaptor.timeout.should == StatRaptor::Config::DEFAULT_TIMEOUT
    end
  end

  describe ".timeout=" do
    it "should set the timeout" do
      StatRaptor.timeout = 15
      StatRaptor.timeout.should == 15
    end
  end

  describe ".disable_ssl_peer_verification" do
    it "should return the default setting" do
      StatRaptor.disable_ssl_peer_verification.should == StatRaptor::Config::DEFAULT_DISABLE_SSL_PEER_VERIFICATION
    end
  end

  describe ".disable_ssl_peer_verification=" do
    it "should set the disable_ssl_peer_verification option" do
      StatRaptor.disable_ssl_peer_verification = true
      StatRaptor.disable_ssl_peer_verification.should be_true

      StatRaptor.disable_ssl_peer_verification = false
      StatRaptor.disable_ssl_peer_verification.should be_false
    end
  end

  describe ".configure" do
    StatRaptor::Config::VALID_OPTIONS_KEYS.each do |key|
      it "should set the #{key}" do
        StatRaptor.configure do |config|
          config.send("#{key}=", key)
          StatRaptor.send(key).should == key
        end
      end
    end
  end

end
