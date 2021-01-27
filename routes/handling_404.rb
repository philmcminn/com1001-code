require "sinatra"
set :bind, "0.0.0.0"

not_found do
  "Your custom 404 message or erb file goes here"
end
