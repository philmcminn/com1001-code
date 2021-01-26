require "capybara/rspec"
require "rack/test"
require "rspec"

ENV["APP_ENV"] = "test"
require_relative "../../app"

#module SinatraAppForRSpec
#  def app
#    Sinatra::Application
#  end 
#end

Capybara.app = Sinatra::Application

#RSpec.configure do |config|
#  config.include Rack::Test::Methods
#  config.include SinatraAppForRSpec
#  config.include Capybara::DSL
#end 

RSpec.describe "Simple Form Example" do
  include Capybara::DSL

  describe "The Form Submission Process" do    
    it "submits some data" do
      visit "/simple-form"
      fill_in "text_field", with: "Some Text"
      click_button "Submit"
      expect(page).to have_content "You submitted the text: Some Text"
    end
  end
end
