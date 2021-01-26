require "capybara/rspec"
require_relative "../../app"

Capybara.app = Sinatra::Application

RSpec.describe "Simple Form Examples" do
  include Capybara::DSL

  describe "Simple Form Example" do
    it "submits some data" do
      visit "/simple-form"
      fill_in "text_field", with: "Some Text"
      click_button "Submit"
      expect(page).to have_content "You submitted the text: Some Text"
    end
  end

  describe "Get Form Example" do
    it "submits some data" do
      visit "/get-form"
      fill_in "text_field", with: "Some Text"
      click_button "Submit"
      expect(page).to have_content "You submitted the text: Some Text"
    end
  end

  describe "Post Form Example" do
    it "submits some data" do
      visit "/post-form"
      fill_in "text_field", with: "Some Text"
      click_button "Submit"
      expect(page).to have_content "You submitted the text: Some Text"
    end
  end
end
