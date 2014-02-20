require 'sinatra'

get '/sign_in' do
  "Sign in!"
end

get '/sign_in/:username/:password' do
  user = User.find_by(username: params[:username])
  if user
    if user.authenticate(params[:password])
      "true"
    else
      "authenticationProblem"
    end 
  else
    "userProblem"
  end
end

