require 'spec_helper'

describe StatRaptor::Client::Graphs, :vcr do
  let(:client) { StatRaptor::Client.new }

  ["revenue", "subscribers", "average_lifetime_value", "churn"].each do |graph_name|
    context "#get_#{graph_name}_graph_data" do
      it "should return a hash of #{graph_name} graph data" do
        graph = client.send("get_#{graph_name}_graph_data", :user_credentials => user_credentials, :subdomain => chargify_subdomain)
        graph.should be_a(Hash)
        graph["graph_data"].keys.should include("actual", "projected", "x_labels")
      end
    end
  end

end
