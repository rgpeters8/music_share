require 'sinatra'

get 'sign_in' do
  "Sign in!"
end

get 'api/sign_in' do
  "Sign in 2!"
end

get 'sign_in/hello_world/:username/:password' do
  "Hello #{params[:username]} #{params[:password]}!"
end

get 'api/sign_in/:username/:password' do
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

