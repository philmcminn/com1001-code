require "rspec"
require "rack/test"

require_relative "../../app"

RSpec.describe "Validation and Sanitisation Example" do
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end

  describe "Form Submission" do
    it "says Success when the data is ok" do
      get "/form", "field1" => "Some Text", "field2" => "Some Text"
      expect(last_response.body).to include("Success!")
    end

    it "rejects the form when field1 is not filled out" do
      get "/form", "field2" => "Some Text"
      expect(last_response.body).to include("Please correct the errors below")
      expect(last_response.body).to include("Please enter a value for field 1")
    end

    it "rejects the form when field2 is not filled out" do
      get "/form", "field1" => "Some Text"
      expect(last_response.body).to include("Please correct the errors below")
      expect(last_response.body).to include("Please enter a value for field 2")
    end
  end
end
