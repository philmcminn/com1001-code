require "rspec"

# uncomment one line or the other to check the two are equivalent
require_relative "duplicated_code"
# require_relative "duplicated_code_refactored"

describe "#add_average_width_and_height" do
  context "when given two arrays" do
    it "returns their averages added together" do
      expect(add_average_width_and_height([2, 3, 4], [20, 30, 40])).to eq(33)
    end
  end
end
