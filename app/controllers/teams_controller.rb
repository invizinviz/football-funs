class TeamsController < ApplicationController


  def index
    @teams = Team.all
    # Tweet.publish_tweets
    # Tweet.team_tweets
  end

  def show
    @team = Team.find params[:id]
    # Tweet.publish_tweets(@team)
    # Tweet.team_tweets(@team)
    @tweets = team_tweets(@team)
    if @team.name == "ARSENAL"
      @imgs = @team.instagram_images
    end
  end


  private 
  def team_tweets(team)
    twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['FOOTBALL_CUSTOMER_TW_KEY']
      config.consumer_secret     = ENV['FOOTBALL_CUSTOMER_TW_SECRET_KEY']
      config.access_token        = ENV['FOOTBALL_ACCESS_TOKEN']
      config.access_token_secret = ENV['FOOBALL_ACCESS_TOKEN_SECRET']
    end
    tweets = []
    twitter_client.user_timeline(team.tweetstream_id).each do |tweet|
      tweets << tweet
    end
    tweets
  end
  
end
