require "sinatra"
set :bind, "0.0.0.0"

require "require_all"
require_rel "controllers"
