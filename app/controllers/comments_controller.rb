class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    @post = Post.find_by(id: params[:comment][:post_id])
    @comment = @post.comments.create
    @comment.user_id = current_user.id
    @comment.comment = params[:comment][:comment]
    @comment.save

    respond_with @comment
  end

  def destroy
    # @post.destroy
    # redirect_to root_url
  end
end