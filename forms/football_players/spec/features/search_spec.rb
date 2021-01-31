require_relative "../spec_helper"

describe "the search page" do
  context "with an empty database" do
    it "says the database is empty" do
      visit "/search"
      expect(page).to have_content "Your search revealed no players"
    end
  end

  context "with one record in the database" do
    it "lists the player" do
      add_test_player
      visit "/search"
      expect(page).to have_content "George Test"
      clear_database
    end

    it "does not list the player when a different club is searched for" do
      add_test_player
      visit "/search"
      fill_in "club_search", with: "RSpec F.C."
      click_button "Submit"
      expect(page).to have_content "Your search revealed no players"
      clear_database
    end

    it "lists the player when their club is searched for" do
      add_test_player
      visit "/search"
      fill_in "club_search", with: "Mantester Utd"
      click_button "Submit"
      expect(page).to have_content "George Test"
      clear_database
    end
  end
end
