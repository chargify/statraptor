require 'spec_helper'

describe StatRaptor::Client::Graphs, :vcr do
  let(:client) { StatRaptor::Client.new }

  context "#get_revenue_graph_data" do
    it "returns the revenue graph json" do
      graph_json = client.get_revenue_graph_data(:user_credentials => user_credentials, :subdomain => chargify_subdomain)
      graph_json.should == "{\"graph_data\":{\"actual\":[0,0,557,353,360,460,460,552,512,582,282,282,null,null,null,null],\"projected\":[null,null,null,null,null,null,null,null,null,null,null,282,282,282,282,282],\"x_labels\":[\"Feb\",\"Mar\",\"Apr\",\"May\",\"Jun\",\"Jul\",\"Aug\",\"Sep\",\"Oct\",\"Nov\",\"Dec\",\"Jan\",\"Feb\",\"Mar\",\"Apr\",\"May\"]}}"
    end

    it "raises an exception if the graph data is not found"
  end

  context "#get_subscribers_graph_data" do
    it "returns the subscribers graph json" do
      graph_json = client.get_subscribers_graph_data(:user_credentials => user_credentials, :subdomain => chargify_subdomain)
      graph_json.should == "{\"graph_data\":{\"actual\":[0,0,8,8,8,10,10,13,14,16,9,6,null,null,null,null],\"projected\":[null,null,null,null,null,null,null,null,null,null,null,6,4,4,4,4],\"x_labels\":[\"Feb\",\"Mar\",\"Apr\",\"May\",\"Jun\",\"Jul\",\"Aug\",\"Sep\",\"Oct\",\"Nov\",\"Dec\",\"Jan\",\"Feb\",\"Mar\",\"Apr\",\"May\"]}}"
    end

    it "raises an exception if the graph data is not found"
  end

  context "#get_average_lifetime_value_graph_data" do
    it "returns the average lifetime value graph json" do
      graph_json = client.get_average_lifetime_value_graph_data(:user_credentials => user_credentials, :subdomain => chargify_subdomain)
      graph_json.should == "{\"graph_data\":{\"actual\":[0,0,79,102,143,160,202,214,255,244,466,747,null,null,null,null],\"projected\":[null,null,null,null,null,null,null,null,null,null,null,747,1028,1309,1590,1871],\"x_labels\":[\"Feb\",\"Mar\",\"Apr\",\"May\",\"Jun\",\"Jul\",\"Aug\",\"Sep\",\"Oct\",\"Nov\",\"Dec\",\"Jan\",\"Feb\",\"Mar\",\"Apr\",\"May\"]}}"
    end

    it "raises an exception if the graph data is not found"
  end

  context "#get_churn_graph_data" do
    it "returns the churn graph json" do
      graph_json = client.get_churn_graph_data(:user_credentials => user_credentials, :subdomain => chargify_subdomain)
      graph_json.should == "{\"graph_data\":{\"actual\":[0,0,20,0,0,33,0,0,50,0,200,200,null,null,null,null],\"projected\":[null,null,null,null,null,null,null,null,null,null,null,200,200,200,200,200],\"x_labels\":[\"Feb\",\"Mar\",\"Apr\",\"May\",\"Jun\",\"Jul\",\"Aug\",\"Sep\",\"Oct\",\"Nov\",\"Dec\",\"Jan\",\"Feb\",\"Mar\",\"Apr\",\"May\"]}}"
    end

    it "raises an exception if the graph data is not found"
  end
end
