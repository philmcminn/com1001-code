require "rspec"
require "rack/test"

require_relative "puts_example"

RSpec.describe "Puts Example App" do
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
