require "rspec"
require "sequel"

# set up DB
DB = Sequel.sqlite(File.dirname(__FILE__) + "/../../db/test.sqlite3")

require_relative "../../models/player"

RSpec.describe Player do
  describe "#name" do
    it "returns the player's full name" do
      player = Player.new(first_name: "A", surname: "B")
      expect(player.name).to eq("A B")
    end
  end

  describe "#age" do
    it "returns the age of the player" do
      player = Player.new(date_of_birth: "2000-1-1")
      expect(player.age("2020-1-1")).to eq(20)
    end
  end
end
