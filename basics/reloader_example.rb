require "sinatra"
require "sinatra/reloader"
set :bind, "0.0.0.0"

get "/" do
  "Change me, save, and reload the web page"
end
