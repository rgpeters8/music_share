class YoutubeController < ApplicationController
  before_action :signed_in_user, only: [:search]
    
  def search
    @search = params[:term]
  end
  
end