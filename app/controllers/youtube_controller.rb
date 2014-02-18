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
    opts = Trollop::options do
      opt :q, 'Search term', :type => String, :default => term
      opt :maxResults, 'Max results', :type => :int, :default => 25
    end
    
    client = Google::APIClient.new(:key => DEVELOPER_KEY,
                                   :authorization => nil)
    youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)
    
    # Call the search.list method to retrieve results matching the specified
    # query term.
    opts[:part] = 'id,snippet'
    search_response = client.execute!(
      :api_method => youtube.search.list,
      :parameters => opts
    )
    
    @search_results = []
    channels = []
    playlists = []
    
    # Add each result to the appropriate list, and then display the lists of
    # matching videos, channels, and playlists.
    search_response.data.items.each do |search_result|
      case search_result.id.kind
        when 'youtube#video'
          @search_results.push(search_result)
      end
    end
  end
  
  def post
    @title = params[:title]
    @id = params[:youtube_id]
    @post = current_user.posts.build
  end
end