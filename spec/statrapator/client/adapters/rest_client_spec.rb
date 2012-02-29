require 'spec_helper'

describe StatRaptor::Client::Adapters::RestClient do
  describe ".request_api_response", :vcr do
    it "returns a RestClient response" do
      response = StatRaptor::Client::Adapters::RestClient.request_api_response(:get, "/users.json")
      [:code, :headers, :raw_headers].each do |attr|
        response.respond_to?(attr).should be_true
      end
    end
  end
end
