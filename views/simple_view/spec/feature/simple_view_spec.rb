require "rspec"
require "rack/test"

require_relative "../../app"

RSpec.describe "Simple View App" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /" do
    it "loads ok'" do
      get "/"
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Showing how")
    end
  end
end
