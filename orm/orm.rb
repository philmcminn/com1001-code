require "sequel" 

DB = Sequel.connect("sqlite://../databases/football_players.sqlite3")

# DB['select * from players'].each do |row|
#   p row
# end

class Player < Sequel::Model 
end

player = Player.first
p player

players = Player.all

players.each do |player|
  p player
end