require "sinatra"
set :bind, "0.0.0.0"

def numeric?(str)
  str.match(/^(\d)+$/)
end

def date?(year, month, day)
  numeric?(year) &&
    numeric?(month) &&
    numeric?(day) &&
    Date.valid_date?(year.to_i, month.to_i, day.to_i)
end

get "/date/*-*-*" do
  y = params[:splat][0]
  m = params[:splat][1]
  d = params[:splat][2]

  not_found unless date?(y, m, d)

  "The date requested is #{y}-#{m}-#{d}"
end

not_found do
  "The page was not found"
end
