# Gems
require "logger"
require "require_all"
require "sequel"
require "sinatra"
require "sinatra/reloader"

include ERB::Util

# For Codio
set :bind, '0.0.0.0'

# Database
db_name = ENV.fetch("APP_ENV", "production")
DB = Sequel.sqlite("db/#{db_name}.sqlite3",
                   logger: Logger.new("db/#{db_name}.log"))

# App
require_all "models"
require_all "controllers"
require_all "helpers"
