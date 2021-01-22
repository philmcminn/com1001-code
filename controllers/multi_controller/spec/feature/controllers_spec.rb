require "rspec"
require "rack/test"

require_relative '../../app'

RSpec.describe "Multi Controller App" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /" do
    it "loads a page" do
      get "/"
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /list-products" do
    it "loads a page" do
      get "/"
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /admin/login" do
    it "loads a page" do
      get "/"
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /admin/login" do
    it "loads a page" do
      get "/"
      expect(last_response.status).to eq(200)
    end
  end
end
