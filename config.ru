# This file is used by Rack-based servers to start the application.
require './app/controllers/api/sign_in_controller'
require ::File.expand_path('../config/environment',  __FILE__)

run Rails.application

map "/" do
  run Rails.application    
end

map "/api" do
  run Sinatra::Application
end