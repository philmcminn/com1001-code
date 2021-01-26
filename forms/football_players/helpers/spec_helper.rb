# set up DB
ENV["APP_ENV"] = "test"
require_relative("../db/db")

# Configure coverage logging
require "simplecov"
SimpleCov.start do
  add_filter "/spec/"
end
SimpleCov.coverage_dir "spec/coverage"

# load the app
require_relative "../app"

# Configure Capybara and RSpec
require "capybara/rspec"
Capybara.app = Sinatra::Application
RSpec.configure do |config|
  config.include Capybara::DSL
end
