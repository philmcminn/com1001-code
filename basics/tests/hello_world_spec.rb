require 'rspec'
require 'rack/test'

require './hello_world.rb'

RSpec.describe 'Hello World App' do
    include Rack::Test::Methods

    def app
        Sinatra::Application
    end 

    specify "Says Hello, World!" do
        get '/hello-world'
        expect(last_response).to be_ok
        expect(last_response.body).to eq('Hello, World!')
    end
end