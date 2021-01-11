require "rspec"
require_relative "../debugging/string_comparison"

RSpec.describe do
  describe "#string_comparison" do
    context "when given two strings, 'aardvark' and 'aargh!'" do
      it "returns 3" do
        expect(string_comparison("aardvark", "aargh!")).to eq(3)
      end
    end

    context "when given two strings, 'sought' and 'bought'" do
      it "returns 0" do
        expect(string_comparison("sought", "bought")).to eq(0)
      end
    end
  end
end
