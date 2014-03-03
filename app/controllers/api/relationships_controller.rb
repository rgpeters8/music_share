require 'sinatra'
require 'json'

get '/relationships/create/:follower/:followed' do
  follower = User.find_by(username: params[:follower])
  followed = User.find_by(username: params[:followed])
  if follower && followed
    if follower.follow!(followed)
      "success"
    else
      "failure"      
    end
  else
    "No user found; either follower -> #{params[:follower]} or followed -> #{params[:followed]}"
  end
end

get '/relationships/destroy/:follower/:followed' do
  follower = User.find_by(username: params[:follower])
  followed = User.find_by(username: params[:followed])
  if follower && followed
    if follower.unfollow!(followed)
      "success"
    else
      "failure"      
    end
  else
    "No user found; either follower -> #{params[:follower]} or followed -> #{params[:followed]}"
  end
end

