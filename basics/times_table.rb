require 'sinatra'
set :bind, '0.0.0.0'

TIMES_TABLE = 3;
LIMIT = 10;

get '/' do
    title = "#{TIMES_TABLE} times table";
    output = "<html><head><title>#{title}</title></head>"
    output += "<body><h1>#{title}</h1><ul>"
    for i in 1..LIMIT
        result = i * TIMES_TABLE
        text = "#{i} times #{TIMES_TABLE} = #{result}"
        output += "\n\t\t\t<li>#{text}</li>"
      end
    output += "</ul></body></html>"
    output
end