module StatRaptor
  class Client
    module Graphs
      def get_revenue_graph_data(params = {})
        graph_data("revenue", params)
      end

      def get_subscribers_graph_data(params = {})
        graph_data("subscribers", params)
      end

      def get_average_lifetime_value_graph_data(params = {})
        graph_data("average_lifetime_value", params)
      end

      def get_churn_graph_data(params = {})
        graph_data("churn", params)
      end

      private

      def graph_data(type, params = {})
        get("/api/v1/graphs/#{type}.json", params)
      end
    end
  end
end
