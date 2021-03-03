require "logger"
require "sequel"

DB = Sequel.sqlite("../databases/football_players.sqlite3",
                   logger: Logger.new("db.log"))

puts "Please enter a club name:"
supplied_club = gets.chomp

dataset = DB[:players].where(club: supplied_club)
num_rows = dataset.count

if num_rows.zero?
  puts "Sorry there are no players for that club."
else
  dataset.each do |record|
    puts record
  end
end
