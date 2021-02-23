require "sinatra"
set :bind, "0.0.0.0"

get "/hello-world" do
  "Hello, World!"
end

# These lines of code below just print the message for the URL that you need for Codio.
# You do not need them for Sinatra applications in general.
if ENV["USER"] == "codio"
  box_name = ENV["CODIO_HOSTNAME"]
  port = settings.port
  base_url = "https://#{box_name}-#{port}.codio.io"
  route = "/hello-world"
  url = "#{base_url}#{route}"
  message = "  CLICK THIS URL TO ACCESS THIS EXAMPLE: #{url}  "
  stars = "*" * message.length
  puts "\n#{stars}\n#{message}\n#{stars}\n\n"
end
