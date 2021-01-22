require "logger"
require "sequel"

DB = Sequel.sqlite("../databases/football_players.sqlite3",
                   logger: Logger.new("db.log"))
require_relative "player"

# Create a new player instance
player = Player.new
player.first_name = "Marcus"
player.surname = "Rashford"
player.club = "Manchester United"

# Save to the database
player.save_changes

# Update his club and save again
player.club = "Manchester City"
player.save_changes

# Now delete
player.delete
