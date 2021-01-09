require 'sinatra'
set :bind, '0.0.0.0'

get '/' do
  numerator = 5
  demoninator = 0
  numerator / demoninator
end
