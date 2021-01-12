require "sequel" 

DB = Sequel.connect("sqlite://../databases/football_players.sqlite3")

DB["select * from players"].each do |row|
  puts row
end

