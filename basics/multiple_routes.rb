require "sinatra"
set :bind, "0.0.0.0"

get "/first-route" do
  "This code is run when first-route is invoked"
end

get "/second-route" do
  "This code is run when second-route is invoked"
end
