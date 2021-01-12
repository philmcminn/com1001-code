require "sequel" 
require "time_difference" 

DB = Sequel.connect("sqlite://../databases/football_players.sqlite3")

#DB = Sequel.sqlite

# DB['select * from players'].each do |row|
#   p row
# end

class Player < Sequel::Model 
  def name
    self.first_name + " " + self.surname
  end
  
  def age
    dob = Date.strptime(self.date_of_birth, "%Y-%m-%d")
    TimeDifference.between(dob, Date.today).in_years.floor    
  end
end

#player = Player.first
#p player

players = Player.all

players.each do |player|
  p player.age
end