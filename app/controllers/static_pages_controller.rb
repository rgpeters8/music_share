class StaticPagesController < ApplicationController
  
  def home
    if signed_in?
      @post  = current_user.posts.build
      @feed_items = current_user.feed(nil).paginate(page: params[:page], :per_page => 10)
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
end
