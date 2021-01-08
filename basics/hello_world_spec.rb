require "rspec"
require "rack/test"

require_relative "hello_world"

RSpec.describe "Hello World App" do
  include Rack::Test::Methods

  def app
   Sinatra::Application
  end 

  describe "GET /hello-world" do    
    it "says 'Hello, world'" do
      get "/hello-world"
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq("Hello, World!")
    end
  end
end
