require 'rspec'
require 'rack/test'

require './multiple_routes.rb'

RSpec.describe 'Multiple Routes App' do
    include Rack::Test::Methods

    def app
        Sinatra::Application
    end 

    specify "first-route outputs correct message" do
        get '/first-route'
        expect(last_response).to be_ok
        expect(last_response.body).to eq('This code is run when first-route is invoked')
    end

    specify "second-route outputs correct message" do
        get '/second-route'
        expect(last_response).to be_ok
        expect(last_response.body).to eq('This code is run when second-route is invoked')
    end
end