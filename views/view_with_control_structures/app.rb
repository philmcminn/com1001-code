require "sinatra"
set :bind, "0.0.0.0"

get "/" do
  @times_table = 3
  @limit = 10
  erb :index
end
