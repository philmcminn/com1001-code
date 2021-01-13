require "sinatra"
set :bind, "0.0.0.0"

get "/" do
  @title = "The Current Date and Time"
  erb :index
end
