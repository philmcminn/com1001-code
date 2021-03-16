require "sinatra"
set :bind, "0.0.0.0"

include ERB::Util

require "require_all"
require_rel "controllers"
