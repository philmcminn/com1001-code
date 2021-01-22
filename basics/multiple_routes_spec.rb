require "rspec"
require "rack/test"

require_relative "multiple_routes"

RSpec.describe "Multiple Routes App" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /first-route" do
    get "/first-route"

    it "loads ok" do
      expect(last_response).to be_ok
    end

    it "outputs the correct message for first-route" do
      expect(last_response.body).to eq("This code is run when first-route is invoked")
    end
  end

  describe "GET /second-route" do
    get "/second-route"

    it "loads ok" do
      expect(last_response).to be_ok
    end

    it "outputs the correct message for second-route" do
      expect(last_response.body).to eq("This code is run when second-route is invoked")
    end
  end
end
