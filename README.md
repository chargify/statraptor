StatRaptor API wrapper for Ruby [![build status](https://secure.travis-ci.org/chargify/statraptor.png)](http://travis-ci.org/chargify/statraptor)
===============================

Interact with client like so:

``` ruby
# Configure the library to use your
# StatRaptor platform credentials

StatRaptor.configure do |config|
  config.platform_credentials = "ABC123"
end

# Initialize a client
client = StatRaptor::Client.new

# Manage users
client.create_user(:email => "timmy@example.com", :chargify_api_key => "XYZ456")
client.delete_user("akskd8328389281728918")

# Manage projects
client.create_project(:user_credentials => "3892839akslje",
  :project => {:name => "Zippy", :subdomain => "zippy-llc", :component => "advanced"})
client.delete_project(:user_credentials => "3892839akslje", :subdomain => "zippy-llc")

# Graphs
client.get_revenue_graph_data(:user_credentials => "3892839akslje", :subdomain => "zippy-llc")
client.get_subscribers_graph_data(:user_credentials => "3892839akslje", :subdomain => "zippy-llc")
client.get_average_lifetime_value_graph_data(:user_credentials => "3892839akslje", :subdomain => "zippy-llc")
client.get_churn_graph_data(:user_credentials => "3892839akslje", :subdomain => "zippy-llc")
```

### Installation

You can install this library as a gem using the following command:

```
$ gem install statraptor
```

If you're using Rails, include the gem in your Gemfile:

``` ruby
gem 'statraptor'
```

### Resources

The following resources exist for interacting with the StatRaptor API:

* `StatRaptor::Client::Users`
* `StatRaptor::Client::Projects`
* `StatRaptor::Client::Graphs`
