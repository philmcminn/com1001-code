require "rspec"
require "rack/test"

require_relative "../../app"

RSpec.describe "Views of Views App" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "includes the header and footer" do
    get "/"
    expect(last_response).to be_ok
    expect(last_response.body).to include("The Current Date and Time")
    expect(last_response.body).to include("COM1001 Enterprises, Ltd")
  end
end
