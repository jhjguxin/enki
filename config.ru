# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Enki::Application

# You can install Rack middlewares
# to do some crazy stuff like logging,
# filtering, auth or build your own.
Rack::CommonLogger
