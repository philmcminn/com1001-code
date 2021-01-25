require "rspec"
require "rack/test"

require_relative "times_table"

RSpec.describe "Times Table Sinatra Example" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /times-table" do
    it "Says '1 times 3 = 3'" do
      get "/times-table"
      expect(last_response.body).to include("1 times 3 = 3")
    end

    it "Says '2 times 3 = 6'" do
      get "/times-table"
      expect(last_response.body).to include("2 times 3 = 6")
    end
  end
end
