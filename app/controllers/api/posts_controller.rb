require 'sinatra'

get '/posts/create/:username/:password/:youtube_id/:title/:description/:category' do
  user = User.find_by(username: params[:username])
  if user
    if user.authenticate(params[:password])
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
      "Incorrect Password for #{params[:username]}"
    end 
  else
    "No user found with username #{params[:username]}"
  end
end



