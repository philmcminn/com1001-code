# Configure coverage logging
require "simplecov"
SimpleCov.start do
  add_filter "/spec/"
end
SimpleCov.coverage_dir "coverage"

# Ensure we use the test database
ENV["APP_ENV"] = "test"

# load the app
require_relative "../app"

# Configure Capybara
require "capybara/rspec"
Capybara.app = Sinatra::Application

# Configure RSpec
def app
  Sinatra::Application
end
RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Rack::Test::Methods
end

# add some test data to our test database
def add_test_player
  player = Player.new(first_name: "Test",
                      surname: "Player",
                      gender: "-",
                      club: "Test F.C.",
                      position: "Left Back",
                      country: "United Testdom",
                      date_of_birth: "2020-01-01")
  player.save_changes
end

# handy method to clear out the database
def clear_database
  DB.from("players").delete
end

# ensure we're always starting from a clean database
clear_database
