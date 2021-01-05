require './tests/sinatra_test_helper'

RSpec.describe 'The Hello World App' do
  
  specify "says Hello, world" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Hello, world')
  end
end