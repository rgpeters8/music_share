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

get '/relationships/get/followers/:username/:page' do
  user = User.find_by(username: params[:username])
  followers = user.followers.paginate(page: params[:page], per_page: 10)
  followers.to_json
end

get '/relationships/get/followed_users/:username/:page' do
  user = User.find_by(username: params[:username])
  followed_users = user.followed_users.paginate(page: params[:page], per_page: 10)
  followed_users.to_json
end

get '/relationships/follow_check/:follower/:followed' do
  this = User.find_by(username: params[:follower])
  other = User.find_by(username: params[:followed])
  if this.following?(other)
    "true"
  else
    "false"
  end
       
end

