require "rspec"
require "rack/test"

require_relative "reloader_example"

RSpec.describe "Reloader Example Sinatra Example" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /reloader-example" do
    it "loads correctly" do
      get "/reloader-example"
      expect(last_response.status).to eq(200)
    end
  end
end
