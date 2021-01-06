require 'sinatra'
set :bind, '0.0.0.0'

require "./controllers/user_facing.rb"
require "./controllers/admin_system.rb"
