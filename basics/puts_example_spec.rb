require "rspec"
require "rack/test"

require_relative "puts_example"

RSpec.describe "Puts Example Sinatra Example" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /puts-example" do
    it "loads correctly" do
      get "/puts-example"
      expect(last_response.status).to eq(200)
    end
  end
end
