# Gems
require "require_all"
require "sinatra"

# For Codio
set :bind, '0.0.0.0'

# So we can escape HTML special characters in the view
include ERB::Util

# Require main app files
require_rel "db/db", "models", "controllers", "helpers"
