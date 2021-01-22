require "rspec"
require "rack/test"

require_relative "../../app"

RSpec.describe "Times Table App" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "Says 3 Times Table" do
    get "/"
    expect(last_response).to be_ok

    expect(last_response.body).to include("1 times 3 = 3")
    expect(last_response.body).to include("3 times 3 = 9")
    expect(last_response.body).to include("9 times 3 = 27")
  end
end
