class StaticPagesController < ApplicationController
  require 'koala'
  
  def home
    if signed_in?
      @post  = current_user.posts.build
      @category = params[:category]

      @user = User.find(session[:user_id]) if session[:user_id]
      
      if @category.blank?
        @feed_items = current_user.feed(nil).paginate(page: params[:page], :per_page => 10)    
      else
        @feed_items = current_user.feed(@category).paginate(page: params[:page], :per_page => 10)
      end
    end
  end
  
  def help
  end
  
  def about
  end
  
  def contact
  end
  
  def search
  end
  
  def mobile
  end
  
end
