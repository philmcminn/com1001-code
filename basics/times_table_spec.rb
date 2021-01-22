require "rspec"
require "rack/test"

require_relative "times_table"

RSpec.describe "Times Table App" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /times-table" do
    it "Says 3 Times Table" do
      get "/times-table"
      expect(last_response.body).to include("1 times 3 = 3")
    end
  end
end
