class TeamsController < ApplicationController


  def index
    @teams = Team.all
    Tweet.publish_tweets
  end

  def show
    @team = Team.find params[:id]
    # Tweet.publish_tweets(@team)
    # Tweet.team_tweets(@team)
    @tweets = team_tweets(@team)
  end


  private 
####################### DONT WORK
  def team_stream(team)
    client = Faye::Client.new('http://localhost:9292/faye')
    twitter_client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_API_KEY']
      config.consumer_secret     = ENV['TWITTER_API_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end

    topics = ["chelsea", "arsenal"]
    twitter_client.filter(track: topics.join(",")) do |object|
      client.publish("/tweets/#{team.channel}", object)
      puts object.text if object.is_a?(Twitter::Tweet)
    end
  end
########################################
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
