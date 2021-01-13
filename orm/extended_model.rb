require "sequel" 
require "time_difference" 

DB = Sequel.connect("sqlite://../databases/football_players.sqlite3")

class Player < Sequel::Model
  def name
    "#{first_name} #{surname}"
  end

  def age(at_date = Date.today)
    dob = Date.strptime(date_of_birth, "%Y-%m-%d")
    TimeDifference.between(dob, at_date).in_years.floor
  end
end

players = Player.all
players.each do |player|
  puts player
end
