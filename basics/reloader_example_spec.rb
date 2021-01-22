require "rspec"
require "rack/test"

require_relative "reloader_example"

RSpec.describe "Reloader Example App" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /" do
    it "loads correctly" do
      get "/"
      expect(last_response.status).to eq(200)
    end
  end
end
