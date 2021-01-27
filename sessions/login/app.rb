# Gems
require "require_all"
require "sequel"
require "sinatra"

# For Codio
set :bind, '0.0.0.0'

# Sessions
enable :sessions
set :session_secret, "$g]Rd2M/WbJ`~~<GZWdH@Fm'ESk2_gckCtLJJkySYG"

# Database
require_relative "db/db"

# App
require_all "models"
require_all "controllers"
