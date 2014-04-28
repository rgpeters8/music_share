class PostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy, :play]
  before_action :correct_user,   only: :destroy

  def create
    @post = current_user.posts.build(post_params)
    @post.play_count = 0;

    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'youtube/post'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_url
  end

  def increment_play_count
    @post = Post.find_by(id: params[:postID])
    @post.play_count += 1
    @post.save
    render :text => @post.play_count
  end
  
  private

    def post_params
      params.require(:post).permit(:title, :youtube_id, :category, :description)
    end
    
    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end