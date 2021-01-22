require "sinatra"
set :bind, "0.0.0.0"

get "/buggy-route" do
  numerator = 5
  denominator = 0
  numerator / denominator
end
