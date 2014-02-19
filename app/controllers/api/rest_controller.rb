require 'sinatra'

get '/hello_world/:username/:password' do
  "Hello #{params[:username]} #{params[:password]}!"
end

get '/authenticate/:username/:password' do
  user = User.find_by(username: "exampleUser")
    if user && user.authenticate("foobar")
      "true"
    else
      "false"
    end
end

