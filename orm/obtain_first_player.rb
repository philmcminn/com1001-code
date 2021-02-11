require "logger"
require "sequel"

DB = Sequel.sqlite("../databases/football_players.sqlite3",
                   logger: Logger.new("db.log"))
require_relative "player"

puts "Please enter a player's ID:"
supplied_id = gets.chomp

player = Player.first(id: supplied_id)
if player.nil?
  puts "No player exists with that ID"
else
  puts "#{player.name}, Age: #{player.age}"
end
