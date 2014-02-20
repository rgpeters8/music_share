require 'sinatra'

get 'api/hello_world/:username/:password' do
  "Hello #{params[:username]} #{params[:password]}!"
end

get 'hello_world/:username/:password' do
  "Hello #{params[:username]} #{params[:password]}! 2"
end