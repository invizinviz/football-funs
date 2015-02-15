class TeamsController < ApplicationController
  # before_action :set_twitter_client, only: [:team_official_timeline_tweets, :team_tweets_for_stream]

  def index
    @teams = Team.all
    # Tweet.publish_tweets
    Tweet.team_tweets
  end

  def show
    @team = Team.find params[:id]
    # Tweet.publish_tweets(@team)
    # Tweet.team_tweets(@team)
    @tweets = team_official_timeline_tweets(@team)
    @tweets_mentions = team_tweets_for_stream(@team)
    # raise
    @imgs = @team.instagram_images
  end


  private 
  def set_twitter_client
     twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['FOOTBALL_CUSTOMER_TW_KEY']
      config.consumer_secret     = ENV['FOOTBALL_CUSTOMER_TW_SECRET_KEY']
      config.access_token        = ENV['FOOTBALL_ACCESS_TOKEN']
      config.access_token_secret = ENV['FOOBALL_ACCESS_TOKEN_SECRET']
    end
  end

  def team_official_timeline_tweets(team)
    tweets = []
    set_twitter_client.user_timeline(team.tweetstream_id).each { |tweet| tweets << tweet  }
  end

  def team_tweets_for_stream(team)
    tweets = [] 
    set_twitter_client.retweeted_by_user(team.tweetstream_id).each { |tweet| tweets << tweet  }
  end

end
