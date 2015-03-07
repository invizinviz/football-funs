class TeamsController < ApplicationController

  before_action :standings
  before_action :set_teams

  def about
    # Tweet.team_tweets
  end

  def scheme
  end


  def index
    # Tweet.team_tweets
    # update_banners
  end

  def show
    @team = Team.find params[:id]
    @tweets = team_official_timeline_tweets(@team)
    @tweets_mentions = team_tweets_for_stream(@team)
    if @team.name != "EVERTON"
      @imgs = @team.instagram_images
    end
    @tweet = Tweet.new
  end

  def tweet_create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
  end


  private 
  def set_teams
    @teams = Team.all
  end

  def set_twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['FOOTBALL_CUSTOMER_TW_KEY']
      config.consumer_secret     = ENV['FOOTBALL_CUSTOMER_TW_SECRET_KEY']
      config.access_token        = ENV['FOOTBALL_ACCESS_TOKEN']
      config.access_token_secret = ENV['FOOBALL_ACCESS_TOKEN_SECRET']
    end
  end

  def standings
    @standings = HTTParty.get("http://football-api.com/api/?Action=standings&APIKey=#{ENV['FOOTBALL_API']}&comp_id=1204")
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
    set_twitter_client.profile_banner(team.tweetstream_id).attrs[:sizes][:web_retina][:url]
  end

  def teams_banners(teams)
    banners = []
    teams.all.each do |team|
      banners << team_banner(team)
    end
  end

  def update_banners
    @teams.each do |team|
      url = URI(team.twitter_banner)
      res = Net::HTTP.get_response(url)
      if res.code == "404"
        team.twitter_banner = team_banner(team)
        team.save
      end
    end   
  end
  
  def tweet_params
    params.require(:tweet).permit(:message)
  end

end
