require "rspec"
require "rack/test"

ENV['APP_ENV'] = "test"
require_relative "../../app"

RSpec.describe "Football Players App" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  before do
    DB.from("players").delete
  end

  describe "GET /list" do
    context "with an empty database" do
      it "says the database is empty" do
        get "/list"
        expect(last_response).to be_ok
        expect(last_response.body).to include("The database is empty!")
      end
    end

    context "with one record in the database" do
      it "lists the player" do
        player = Player.new(first_name: "Test", surname: "Player", date_of_birth: "2020-1-1")
        player.save
        get "/list"
        expect(last_response).to be_ok
        expect(last_response.body).to include("Test Player")
      end
    end
  end
end
