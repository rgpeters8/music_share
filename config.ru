# This file is used by Rack-based servers to start the application.
require './app/controllers/api/rest_controller'
require ::File.expand_path('../config/environment',  __FILE__)

run Rails.application
