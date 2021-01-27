# Gems
require "require_all"
require "sequel"
require "sinatra"

# For Codio
set :bind, '0.0.0.0'

# Sessions
enable :sessions

# Database
DB = Sequel.sqlite("db/#{ENV.fetch('APP_ENV', 'production')}.sqlite3")

# App
require_all "models"
require_all "controllers"
