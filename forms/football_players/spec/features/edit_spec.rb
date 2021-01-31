require_relative "../spec_helper"

describe "the edit page" do
  it "shows an error when trying to load an invalid player" do
    visit "/edit?id=-100"
    expect(page).to have_content "Unknown player"
  end

  it "allows editing of a valid player" do
    add_test_player
    visit "/edit?id=1"
    expect(page).to have_content "Edit Player"
    clear_database
  end

  it "allows a player record to be changed" do
    add_test_player
    visit "/edit?id=1"
    fill_in "first_name", with: "Zinedine"
    click_button "Submit"
    expect(page).to have_content "Zinedine Test"
    clear_database
  end

  it "won't save invalid data" do
    add_test_player
    visit "/edit?id=1"
    fill_in "first_name", with: ""
    click_button "Submit"
    expect(page).to have_content "Please correct the errors below"
    clear_database
  end
end
