require "rspec"
require "rack/test"

require_relative "buggy_route"

RSpec.describe "Buggy Route App" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /" do
    it "Gives a 500 error" do
      get "/"
      expect(last_response.status).to eq(500)
    end
  end
end
