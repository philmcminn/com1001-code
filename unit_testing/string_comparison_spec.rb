require "rspec"
require_relative "../debugging/string_comparison"

RSpec.describe do
  describe "#string_comparison" do
    context "when given two empty strings" do
      it "returns -1" do
        expect(string_comparison("", "")).to eq(-1)
      end
    end

    context "when given two strings that are different single characters" do
      it "returns 0" do
        expect(string_comparison("a", "b")).to eq(0)
      end
    end

    context "when given two strings of the same single character" do
      it "returns -1" do
        expect(string_comparison("a", "a")).to eq(-1)
      end
    end

    context "when given two strings that the same, of length > 1" do
      it "returns -1" do
        expect(string_comparison("ab", "ab")).to eq(-1)
      end
    end

    context "when given two strings of the same length, differing by the last character" do
      it "returns the length of the string minus 1" do
        expect(string_comparison("abc", "abz")).to eq(2)
      end
    end

    context "when given two strings of different length, first shorter than the second" do
      it "returns the length of the shorter string" do
        expect(string_comparison("abc", "abcdef")).to eq(3)
      end
    end

    context "when given two strings of different length, second shorter than the first" do
      it "returns the length of the shorter string" do
        expect(string_comparison("abcdef", "abc")).to eq(3)
      end
    end
  end
end
