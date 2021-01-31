require_relative "../spec_helper"

describe "the delete page" do
  it "allows deletion of a valid player" do
    add_test_player
    visit "/edit?id=1"
    click_button "Delete"
    expect(page).to have_content "Your search revealed no players"
  end
end
