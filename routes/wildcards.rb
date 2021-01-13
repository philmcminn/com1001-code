require "sinatra"
set :bind, "0.0.0.0"

get "/date/*-*-*" do
  y = params[:splat][0]
  m = params[:splat][1]
  d = params[:splat][2]

  # Note for slides - the above numbers are not validated...

  "The date requested is #{y}-#{m}-#{d}"
end
