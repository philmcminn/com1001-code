# Gems
require "logger"
require "require_all"
require "sequel"
require "sinatra"

# For Codio
set :bind, '0.0.0.0'

# So we can escape HTML special characters in the view
include ERB::Util

# Database
db_name = ENV.fetch("APP_ENV", "production")
DB = Sequel.sqlite("db/#{db_name}.sqlite3",
                   logger: Logger.new("db/#{db_name}.log"))

# App
require_all "models"
require_all "controllers"
