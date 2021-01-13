# Gems
require "require_all"
require "sinatra"
require "sinatra/reloader"

# For Codio
set :bind, '0.0.0.0'

# App
require_all "controllers"
