class TeamsController < ApplicationController
  # before_action :set_twitter_client, only: [:team_official_timeline_tweets, :team_tweets_for_stream]

  def index
    @teams = Team.all
    Tweet.team_tweets
    @standings = standings
  end

  def show
    @team = Team.find params[:id]
    @tweets = team_official_timeline_tweets(@team)
    @tweets_mentions = team_tweets_for_stream(@team)
    @imgs = @team.instagram_images
    @banner = team_banner(@team)
  end


  private 
  def set_twitter_client
    Twitter::REST::Client.new do |config|
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

  def team_banner(team)
    set_twitter_client.profile_banner(team.tweetstream_id).attrs[:sizes][:web][:url]
  end

  def standings
    teams_standings = HTTParty.get("http://football-api.com/api/?Action=standings&APIKey=#{ENV['FOOTBALL_API']}&comp_id=1204")

  end

end
