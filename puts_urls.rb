# figure out the base URL
port = settings.port
base_url = "http://localhost:#{port}"
if ENV["USER"] == "codio"
  box_name = ENV["CODIO_HOSTNAME"]
  base_url = "https://#{box_name}-#{port}.codio.io"
end

# compile an array of all the GET route paths
urls = []
Sinatra::Application.routes["GET"].each do |route|
  urls << "#{base_url}#{route[0]}"
end

# output
output = " URLs in this application: "
max_len = output.length
urls.each do |url|
  line = " * #{url} "
  max_len = line.length if line.length > max_len
  output += "\n#{line}"
end
stars = "*" * max_len
puts "\n#{stars}\n#{output}\n#{stars}\n\n"
