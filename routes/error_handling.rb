require "sinatra"
set :bind, "0.0.0.0"

disable :raise_errors
disable :show_exceptions

get '/' do
  numerator = 0
  denominator = 0
  numerator / denominator
end

error do
  "There was an error..."
end
