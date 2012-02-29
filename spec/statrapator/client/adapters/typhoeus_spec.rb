require 'spec_helper'

describe StatRaptor::Client::Adapters::Typhoeus do
  describe ".request_api_response", :vcr do
    it "returns a typhoeus response" do
      response = StatRaptor::Client::Adapters::Typhoeus.request_api_response(:get, "/users.json")
      response.should be_a(Typhoeus::Response)
    end
  end
end
