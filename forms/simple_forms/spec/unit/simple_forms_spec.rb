require "rspec"
require "rack/test"

require_relative "../../app"

RSpec.describe "Simple Form Examples" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "Simple Form Example" do
    it "writes the submitted string to the page" do
      get "/process-simple-form", "text_field" => "Some Text"
      expect(last_response.body).to include("Some Text")
    end
  end

  describe "Get Form Example" do
    it "writes the submitted string to the page" do
      get "/process-get-form", "text_field" => "Some Text"
      expect(last_response.body).to include("Some Text")
    end
  end

  describe "Post Form Example" do
    it "writes the submitted string to the page" do
      post "/process-post-form", "text_field" => "Some Text"
      expect(last_response.body).to include("Some Text")
    end
  end
end
