require_relative "../spec_helper"

describe "the delete page" do
  it "allows deletion of a valid player" do
    # setup the test
    add_test_player

    post "/delete", "id" => "1"
    follow_redirect!
    expect(last_request.path).to eq('/search')
  end

  it "does not allow deletion of a valid player" do
    post "/delete", "id" => "-100"
    expect(last_response.body).to include("Unknown player")
  end
end