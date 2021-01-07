require 'sinatra'
set :bind, '0.0.0.0'

get '/' do
    @soup = 'Pea and Ham'
    erb :index
end
