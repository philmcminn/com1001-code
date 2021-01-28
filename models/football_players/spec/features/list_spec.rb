require_relative "../spec_helper"

RSpec.describe "Football Players App" do
  before(:all) do
    DB.from("players").delete
  end

  after do
    DB.from("players").delete
  end

  describe "GET /list" do
    context "with an empty database" do
      it "says the database is empty" do
        get "/list"
        expect(last_response.body).to include("The database is empty!")
      end
    end

    context "with one record in the database" do
      it "lists the player" do
        player = Player.new(first_name: "Test", surname: "Player", date_of_birth: "2020-1-1")
        player.save_changes
        get "/list"
        expect(last_response.body).to include("Test Player")
      end
    end
  end
end
