require "capybara/rspec"
require_relative "../../app"

Capybara.app = Sinatra::Application

RSpec.describe "Validation and Sanitisation Example" do
  include Capybara::DSL

  describe "Form Submission" do
    it "submits some data" do
      visit "/form"
      fill_in "field1", with: "Some Text"
      fill_in "field2", with: "Some Text"
      click_button "Submit"
      expect(page).to have_content "Success!"
    end

    it "rejects the form when field1 is not filled out" do
      visit "/form"
      fill_in "field2", with: "Some Text"
      click_button "Submit"
      expect(page).to have_content "Please correct the errors below"
      expect(page).to have_content "Please enter a value for field 1"
    end

    it "rejects the form when field2 is not filled out" do
      visit "/form"
      fill_in "field1", with: "Some Text"
      click_button "Submit"
      expect(page).to have_content "Please correct the errors below"
      expect(page).to have_content "Please enter a value for field 2"
    end
  end
end
