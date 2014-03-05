require 'sinatra'

get '/users/add/:username/:password/:name/:email' do
  user = User.new
  user.username = params[:username]
  user.password = params[:password]
  user.password_confirmation = params[:password]
  user.name = params[:name]
  user.email = params[:email]
  
  if user.save
    "success"
  else
    user.errors
  end  
end

get '/users/get_by_username/:username' do
  user = User.find_by(username: params[:username])
  user.to_json
end

get '/users/get_by_id/:user_id' do
  user = User.find_by(id: params[:user_id])
  user.to_json
end