require 'spec_helper'

describe StatRaptor::Client::Graphs do
  context "#get_revenue_graph_data" do
    it "returns the revenue graph json"
    it "raises an exception if the graph data is not found"
  end

  context "#get_subscribers_graph_data" do
    it "returns the subscribers graph json"
    it "raises an exception if the graph data is not found"
  end

  context "#get_average_lifetime_value_graph_data" do
    it "returns the average lifetime value graph json"
    it "raises an exception if the graph data is not found"
  end

  context "#get_churn_graph_data" do
    it "returns the churn graph json"
    it "raises an exception if the graph data is not found"
  end
end
