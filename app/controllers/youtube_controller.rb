require 'rubygems'
require 'google/api_client'
require 'trollop'

class YoutubeController < ApplicationController
  before_action :signed_in_user, only: [:search]
  
  require 'rubygems'
  require 'google/api_client'
  require 'trollop'
  
  # Set DEVELOPER_KEY to the "API key" value from the "Access" tab of the
  # Google Developers Console <https://cloud.google.com/console>
  # Please ensure that you have enabled the YouTube Data API for your project.
  DEVELOPER_KEY = "AIzaSyDdFUXYdo-YR_-6lpIW1xj4ZF752XYn54g"
  YOUTUBE_API_SERVICE_NAME = "youtube"
  YOUTUBE_API_VERSION = "v3"
    
  def search
    term = params[:term]
    
    
    client = Google::APIClient.new(:key => DEVELOPER_KEY,
                                   :authorization => nil)
    youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)
    
    # Call the search.list method to retrieve results matching the specified
    # query term.
    search_response = client.execute!(
      :api_method => youtube.search.list,
    )
    
    @api = youtube;
    @search_results = []
    channels = []
    playlists = []
    
    # Add each result to the appropriate list, and then display the lists of
    # matching videos, channels, and playlists.
    search_response.data.items.each do |search_result|
      case search_result.id.kind
        when 'youtube#video'
          # videos = client.execute!(
          #   :api_method => youtube.videos.list,
          #   :parameters => {:id => search_result.id.videoId, :part => 'statistics'}
          # )
          # search_result.class.module_eval { attr_accessor :stats}
          # search_result.stats = videos.data.items[0]
          @search_results.push(search_result)
      end
    end
  end
  
  def post
    @title = params[:title]
    @id = params[:youtube_id]
    @image = params[:image]
    @post = current_user.posts.build
  end
end