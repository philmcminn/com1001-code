require 'sinatra'
set :bind, '0.0.0.0'

get '/get-route' do
    'This route is accessed by GET'
end

put '/put-route' do 
    'This route is accessed by POST. It is inaccessible by typing the URL into your browser.'
end