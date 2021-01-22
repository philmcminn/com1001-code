require "rspec"
require "rack/test"

require_relative "../../app"

RSpec.describe "View with Variables App" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "Says the soup of the day" do
    get "/"
    expect(last_response).to be_ok
    expect(last_response.body).to include("Pea and Ham")
  end
end
