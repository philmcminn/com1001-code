require "logger"
require "sequel"

# Open the database
DB = Sequel.sqlite("temp.sqlite3", logger: Logger.new("db.log"))

# Create the users table if it does not exist
DB.create_table? :users do
  String :username, unique: true, primary_key: true, null: false
  String :iv, null: false
  String :salt, null: false
  String :encrypted_key, null: false
  String :encrypted_address, null: false
  String :encrypted_telephone_number, null: false
end