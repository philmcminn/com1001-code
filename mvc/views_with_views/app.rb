require 'sinatra'
set :bind, '0.0.0.0'

get '/' do
    @title = "The Current Time"
    erb :index
end
