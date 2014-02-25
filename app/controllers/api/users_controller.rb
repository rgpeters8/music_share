require 'sinatra'

get '/users/add/:username/:password/:name/:email' do
  user = User.new
  user.username = params[:username]
  user.password = params[:password]
  user.name = params[:name]
  user.email = params[:email]
  
  if user.save
    "success"
  else
    user.errors
  end  
end