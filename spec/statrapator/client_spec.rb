require 'spec_helper'

describe StatRaptor::Client do
  before do
    @keys = StatRaptor::Config::VALID_OPTIONS_KEYS
  end

  context "with module configuration" do
    before do
      StatRaptor.configure do |config|
        @keys.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    after do
      StatRaptor.reset
    end

    it "should inherit module configuration" do
      client = StatRaptor::Client.new

      @keys.each do |key|
        client.send(key).should == key
      end
    end
  end

  context "with class configuration" do
    before do
      @configuration = {
        :endpoint => "http://example.com",
        :timeout => 300,
        :platform_credentials => "ABC12345",
        :user_agent => "Fu Manchu Ruby Gem 2.0.0"
      }
    end

    context "during initialization" do
      it "should override module configuration" do
        client = StatRaptor::Client.new(@configuration)
        @keys.each do |key|
          client.send(key).should == @configuration[key]
        end
      end
    end

    context "after initialization" do
      it "should override module configuration" do
        client = StatRaptor::Client.new
        @configuration.each do |key, value|
          client.send("#{key}=", value)
        end

        @keys.each do |key|
          client.send(key).should == @configuration[key]
        end
      end
    end
  end

end
