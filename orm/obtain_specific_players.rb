require "logger"
require "sequel"

DB = Sequel.sqlite("../databases/football_players.sqlite3",
                   logger: Logger.new("db.log"))
require_relative "player"

puts "Please enter a player's club:"
supplied_club = gets.chomp

players = Player.where(club: supplied_club)
num_players = players.count

if num_players.zero?
  puts "Sorry there are no players for that club."
else
  players.each do |player|
    puts "* #{player.name}, Age: #{player.age}"
  end
end
