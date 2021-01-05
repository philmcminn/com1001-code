ENV['APP_ENV'] = 'test'

require './hello_world'  # <-- your sinatra app
require 'rspec'
require 'rack/test'
require 'simplecov'

SimpleCov.start do
  add_filter '/tests/'
end

SimpleCov.coverage_dir 'tests/coverage'

module SinatraAppForRSpec
  def app
    Sinatra::Application
  end 
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include SinatraAppForRSpec
end