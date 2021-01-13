require "sinatra"
set :bind, "0.0.0.0"

get "/*" do
  "I am the god of all routes. Nothing shall get past me"
end

get "/introverted-route" do
  "You will never see me"
end
