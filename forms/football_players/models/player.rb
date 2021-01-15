require "time_difference"

# A player record from the database
class Player < Sequel::Model
  def name
    "#{first_name} #{surname}"
  end

  def age(at_date = Date.today)
    dob = Date.strptime(date_of_birth, "%Y-%m-%d")
    TimeDifference.between(dob, at_date).in_years.floor
  end

  def self.valid_id?(id)
    # check the id is not nil
    return false if id.nil?

    # check the id is an integer
    return false unless Validation.str_is_integer?(id)

    # check the database has a record with this id
    return false if Player[id].nil?

    # all checks are ok - the id exists
    true
  end

  def load(params)
    set(first_name: params.fetch("first_name", ""))
    set(surname: params.fetch("surname", ""))
    set(gender: params.fetch("gender", ""))
    set(club: params.fetch("club", ""))
    set(country: params.fetch("country", ""))
    set(position: params.fetch("position", ""))
    set(date_of_birth: params.fetch("date_of_birth", ""))
  end

  def sanitize() 
    first_name.strip!
    surname.strip!
    gender.strip!
    club.strip!
    country.strip!
    position.strip!
    date_of_birth.strip!
  end

  def validate()
    errors = Set.new
    errors << "first_name" if first_name.empty?
    errors << "surname" if surname.empty?
    errors << "gender" if gender.empty? 
    errors << "club" if club.empty?
    errors << "country" if country.empty?
    errors << "position" if position.empty?
    errors << "date_of_birth" if !Validation.str_is_valid_yyy_mm_dd_date?(date_of_birth)
    errors
  end

end
