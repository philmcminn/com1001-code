require "rspec"

require_relative "../debugging/buggy_string_comparison"

RSpec.describe "#string_comparison" do
  context "when given two strings, 'aardvark' and 'aargh!'" do
    result = string_comparison("aardvark", "aargh!")
    it "returns 3" do      
      expect(result).to eq(3)
    end
  end

  context "when given two strings, 'sought' and 'bought'" do
    result = string_comparison("sought", "bought")    
    it "returns 0" do
      expect(result).to eq(0)
    end
  end
end
