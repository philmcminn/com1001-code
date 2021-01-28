require_relative "../spec_helper"

RSpec.describe Player do
  describe "#name" do
    it "returns the player's full name" do
      player = described_class.new(first_name: "A", surname: "B")
      expect(player.name).to eq("A B")
    end
  end

  describe "#age" do
    it "returns the age of the player" do
      player = described_class.new(date_of_birth: "2000-1-1")
      expect(player.age("2020-1-1")).to eq(20)
    end
  end
end
