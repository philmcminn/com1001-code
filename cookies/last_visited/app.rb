# Gems
require "require_all"
require "sinatra"

# For Codio
set :bind, '0.0.0.0'

# App
require_rel "controllers"
