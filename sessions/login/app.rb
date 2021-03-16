# Gems
require "require_all"
require "sequel"
require "sinatra"

# For Codio
set :bind, '0.0.0.0'

# Sessions
enable :sessions
set :session_secret, "$g]Rd2M/WbJ`~~<GZWdH@Fm'ESk2_gckCtLJJkySYG"

# App
require_rel "db/db", "models", "controllers"
