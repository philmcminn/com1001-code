require "sinatra"
set :bind, "0.0.0.0"

["/one", "/two", "/three"].each do |route|
  get route do
    "GET #{route} used to access resource"
  end
end
