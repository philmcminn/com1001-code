require "sinatra"
set :bind, "0.0.0.0"

# Of course, your application
# may determine "production"
# status by some other means/test
ENV["APP"] = "production"

if ENV["APP"] == "production"
  disable :raise_errors
  disable :show_exceptions

  error do
    "There was an error..."
  end
end

get '/' do
  numerator = 0
  denominator = 0
  numerator / denominator
end
