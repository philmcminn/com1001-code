require "sinatra"
set :bind, "0.0.0.0"

get "/puts-example" do
  puts "The user cannot see this!"
  "Hi, folks!"
end
