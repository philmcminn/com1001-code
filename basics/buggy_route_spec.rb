require "rspec"
require "rack/test"

require_relative "buggy_route"

RSpec.describe "Buggy Route Sinatra Example" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /buggy-route" do
    it "Gives a 500 error" do
      get "/buggy-route"
      expect(last_response.status).to eq(500)
    end
  end
end
