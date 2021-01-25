require "rspec"
require "rack/test"

require_relative '../../app'

RSpec.describe "Multi Controller Sinatra Example" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /" do
    it "has a status code of 200 (OK)" do
      get "/"
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /list-products" do
    it "has a status code of 200 (OK)" do
      get "/list-products"
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /admin/login" do
    it "has a status code of 200 (OK)" do
      get "/admin/login"
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /admin/logout" do
    it "has a status code of 200 (OK)" do
      get "/admin/logout"
      expect(last_response.status).to eq(200)
    end
  end
end
