require "rspec"
require "rack/test"

require_relative "verbs"

RSpec.describe "Verbs Sinatra Example" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /get-route" do
    it "Says 'accessed by GET'" do
      get "/get-route"
      expect(last_response.body).to include("accessed by GET")
    end
  end

  describe "POST /post-route" do
    it "Says 'accessed by POST'" do
      post "/post-route"
      expect(last_response.body).to include("accessed by POST")
    end
  end
end
