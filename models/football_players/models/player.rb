require "time_difference"

# A player record from the database
class Player < Sequel::Model
  def name
    "#{first_name} #{surname}"
  end

  def age
    dob = Date.strptime(date_of_birth, "%Y-%m-%d")
    TimeDifference.between(dob, Date.today).in_years.floor
  end
end
