require "sinatra"
set :bind, "0.0.0.0"

get "/*" do
  "I am the god route. Nothing shall escape me"
end

get "/introverted-route" do
  "You will never see me"
end
