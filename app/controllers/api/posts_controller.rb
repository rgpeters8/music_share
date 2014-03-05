require 'sinatra'
require 'json'

get '/posts/create/:username/:youtube_id/:title/:description/:category' do
  user = User.find_by(username: params[:username])
  if user
    post = Post.new
    post.user_id = user.id
    post.youtube_id = params[:youtube_id]
    post.description = params[:description]
    post.title = params[:title]
    post.category = params[:category]
    
    if post.save
      "success"
    else
      post.errors
    end
  else
    "No user found with username #{params[:username]}"
  end
end

get '/posts/destroy/:post_id' do 
  post = Post.find_by(id: params[:post_id])
  if post.destroy
    "success"
  else
    "failure"
  end
end

get '/posts/get/:username/:category/:page' do 
  user = User.find_by(username: params[:username])
  category = params[:category]
      
  if category.blank?
    posts = user.feed(nil).paginate(page: params[:page], :per_page => 10)    
  else
    posts = user.feed(category).paginate(page: params[:page], :per_page => 10)
  end
  
  posts.to_json
end



