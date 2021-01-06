require 'sinatra'
set :bind, '0.0.0.0'

require "./controllers/user-facing.rb"
require "./controllers/admin-system.rb"
