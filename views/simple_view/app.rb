require "sinatra"
set :bind, "0.0.0.0"

get "/" do
  # ... app code ...
  erb :index
end
