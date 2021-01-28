require_relative "../spec_helper"

describe "the edit page" do
  it "shows an error when trying to load an invalid player" do
    visit "/edit?id=-100"
    expect(page).to have_content "Unknown player"
  end

  it "allows editing of a valid player" do
    # setup the test
    add_test_player

    visit "/edit?id=1"
    expect(page).to have_content "Edit Player"

    # ensure we're always starting from a clean database
    clear_database
  end

  it "allows a player recrod to be changed" do
    # setup the test
    add_test_player

    visit "/edit?id=1"
    fill_in "first_name", with: "Testing"
    click_button "Submit"
    expect(page).to have_content "Testing Player"

    # ensure we're always starting from a clean database
    clear_database
  end

  it "won't save invalid data" do
    # setup the test
    add_test_player

    visit "/edit?id=1"
    fill_in "first_name", with: ""
    click_button "Submit"
    expect(page).to have_content "Please correct the errors below"

    # ensure we're always starting from a clean database
    clear_database
  end
end
