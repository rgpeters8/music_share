require 'sinatra'

get '/sign_in/:username/:password' do
  user = User.find_by(username: params[:username])
  if user
    if user.authenticate(params[:password])
      "true"
    else
      "Incorrect Password for #{params[:username]}"
    end 
  else
    "No user found with username #{params[:username]}"
  end
end



