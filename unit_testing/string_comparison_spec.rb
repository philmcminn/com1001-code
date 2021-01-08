require "rspec"

require_relative "../debugging/fixed_string_comparison"

RSpec.describe "#string_comparison" do
  context "when given two empty strings" do
    result = string_comparison("", "")
    it "returns -1" do      
      expect(result).to eq(-1)
    end
  end

  context "when given two strings that are different single characters" do
    result = string_comparison("a", "b")    
    it "returns 0" do
      expect(result).to eq(0)
    end
  end

  context "when given two strings of the same single character" do
    result = string_comparison("a", "a")    
    it "returns -1" do
      expect(result).to eq(-1)
    end
  end

  context "when given two strings that the same, of length > 1" do
    result = string_comparison("ab", "ab")    
    it "returns -1" do
      expect(result).to eq(-1)
    end
  end

  context "when given two strings of the same length, differing by the last character" do
    result1 = string_comparison("abc", "abd")  
    result2 = string_comparison("abd", "abc")    
    it "returns the length of the string minus 1" do
      expect(result1).to eq(2)
      expect(result2).to eq(2)
    end
  end

  context "when given two strings of different length, one is a prefix of the other" do
    result1 = string_comparison("abc", "abcdef")    
    result2 = string_comparison("abcdef", "abc")    
    it "returns the length of the shorter string" do
      expect(result1).to eq(3)
      expect(result2).to eq(3)
    end
  end
end
