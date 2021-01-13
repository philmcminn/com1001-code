require "sequel"
require "time_difference"

DB = Sequel.connect("sqlite://../databases/football_players.sqlite3")

# A player record from the database
class Player < Sequel::Model
end

player = Player.first
puts player
