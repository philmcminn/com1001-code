require_relative "../spec_helper"

describe "the add page" do
  it "is accessible from the search page" do
    visit "/search"
    click_link "Add a new player to the database"
    expect(page).to have_content "Add Player"
  end

  it "will not add a player with no details" do
    visit "/add"
    click_button "Submit"
    expect(page).to have_content "Please correct the errors below"
  end

  it "adds a player when all details are entered" do
    visit "/add"
    fill_in "first_name", with: "Mr"
    fill_in "surname", with: "Test"
    fill_in "gender", with: "Test"
    fill_in "club", with: "Capybara Utd"
    fill_in "country", with: "Great RSpec"
    fill_in "position", with: "Goalkeeper"
    fill_in "date_of_birth", with: "2000-01-01"
    click_button "Submit"
    expect(page).to have_content "Mr Test"

    # clear out the database
    clear_database
  end
end
