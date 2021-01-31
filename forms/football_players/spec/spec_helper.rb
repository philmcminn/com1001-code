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

# add a test player
def add_test_player
  visit "/add"
  fill_in "first_name", with: "George"
  fill_in "surname", with: "Test"
  fill_in "gender", with: "M"
  fill_in "club", with: "Mantester Utd"
  fill_in "country", with: "Northern RSpec"
  fill_in "position", with: "Midfield"
  fill_in "date_of_birth", with: "1946-05-22"
  click_button "Submit"
end

# clear out the database
def clear_database
  DB.from("players").delete
end

# ensure we're always starting from a clean database
clear_database
