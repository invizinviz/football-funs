class TeamsController < ApplicationController

  # $socket = ''

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find params[:id]
    Tweet.publish_tweets(@team)
    # Tweet.team_tweets(@team)
    @tweets = team_tweets(@team)
  end

  # def chelsea
  #   chelseafc = TweetStream::Client.new
  #   chelseafc.follow(22910295) do |status|
  #     puts "hi chelsea"
  #     client = Faye::Client.new('http://localhost:9292/faye')
  #     client.publish('/tweets/chelsea', status)
  #   end  
  # end

  # def arsenal
  #   # ars_tweets()
  #   arsenalfc = TweetStream::Client.new
  #   arsenalfc.follow(34613288) do |status|
  #     puts "hi ars"
  #     client = Faye::Client.new('http://localhost:9292/faye')
  #     client.publish('/tweets/arsenal', status)
  #   end
    
  # end


  private 

  def team_tweets(team)
    twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_API_KEY']
      config.consumer_secret     = ENV['TWITTER_API_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
    tweets = []
    twitter_client.user_timeline(team.tweetstream_id).each do |tweet|
      tweets << tweet
    end
    tweets
  end

  
end
