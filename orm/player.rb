require "time_difference"

# Maps to the "players" table
class Player < Sequel::Model
  # Get a string of the player's name in one method
  def name
    "#{first_name} #{surname}"
  end

  # Get the player's age, based on their date_of_birth
  def age(at_date = Date.today)
    dob = Date.strptime(date_of_birth, "%Y-%m-%d")
    TimeDifference.between(dob, at_date).in_years.floor
  end
end
