it "allows a player record to be changed" do
  # add a player that we can edit
  visit "/add"
  fill_in "first_name", with: "George"
  fill_in "surname", with: "Test"
  fill_in "gender", with: "M"
  fill_in "club", with: "Mantester Utd"
  fill_in "country", with: "Northern RSpec"
  fill_in "position", with: "Midfield"
  fill_in "date_of_birth", with: "1946-05-22"
  click_button "Submit"

  # edit a player
  visit "/edit?id=1"
  fill_in "first_name", with: "Zinedine"
  click_button "Submit"
  expect(page).to have_content "Zinedine Test"
  
  # reset the database
  DB.from("players").delete
end
