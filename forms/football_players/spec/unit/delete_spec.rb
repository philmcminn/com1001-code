require_relative "../spec_helper"

RSpec.describe "Football Players App" do
  describe "POST/delete" do
    it "does not allow deletion of a valid player" do
      post "/delete", "id" => "-100"
      expect(last_response.body).to include("Unknown player")
    end
  end
end
