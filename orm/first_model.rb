require "logger"
require "sequel"

DB = Sequel.sqlite("../databases/football_players.sqlite3",
                   logger: Logger.new("db.log"))

# Maps to the "players" table
class Player < Sequel::Model
end

players = Player.all
players.each do |player|
  puts "#{player.first_name} #{player.surname}"
end
