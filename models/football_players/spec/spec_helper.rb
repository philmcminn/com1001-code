# Ensure we use the test database
ENV["APP_ENV"] = "test"

# load the app
require_relative "../app"

# Configure RSpec
require "rack/test"
require "rspec"
def app
  Sinatra::Application
end
RSpec.configure do |config|
  config.include Rack::Test::Methods
end
