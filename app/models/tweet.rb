class Tweet < ActiveRecord::Base
  belongs_to :team
  @@team_stream = TweetStream::Client.new
  @@faye_client = Faye::Client.new('http://localhost:9292/faye')

  # def self.publish_tweets
      

  #     @@team_stream.on_reconnect do |timeout, retries|
  #       puts "Hit reconnect with timeout of #{timeout} for #{retries} retries"
  #     end

  #     twitter_handles = Team.pluck(:twitter) << "@premierleague"

  #     @@team_stream.track(twitter_handles) do |tweet|
  #       puts "tweet: #{tweet.text}"
  #       twitter_handles.each do |handle|
  #         if tweet.text.include?(handle)
  #           @@faye_client.publish("/tweets/#{handle}", tweet)
  #           puts "published to #{handle}"
  #         end
  #       end
  #     end

  # end

  def self.team_tweets
    # client = Faye::Client.new('http://localhost:9292/faye')

    # twitter_client = Twitter::Streaming::Client.new do |config|
    #     config.consumer_key        = ENV['TWITTER_API_KEY']
    #     config.consumer_secret     = ENV['TWITTER_API_SECRET']
    #     config.access_token        = ENV['ACCESS_TOKEN']
    #     config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    # end


    # topics = ["premierleague", "arsenal", "chelsea"]
    # puts "in team tweets"

    twitter_handles = Team.pluck(:twitter) << "premierleague"
    Thread.new do 
      @@twitter_client.filter(track: twitter_handles.join(","), language: "en") do |tweet|
        puts "tweet: #{tweet.text}"
        twitter_handles.each do |handle|
          if tweet.text.include?(handle)
            @@faye_client.publish("/tweets/#{handle}", tweet)
            puts "published to #{handle}"
          end
        end
      end
    end
  end
end
