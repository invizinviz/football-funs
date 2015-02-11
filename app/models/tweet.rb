class Tweet < ActiveRecord::Base
  belongs_to :team
  @@team_stream = TweetStream::Client.new
  @@faye_client = Faye::Client.new('http://localhost:9292/faye')

  def self.publish_tweets
      

      @@team_stream.on_reconnect do |timeout, retries|
        puts "Hit reconnect with timeout of #{timeout} for #{retries} retries"
      end

      # @@team_stream.track("@premierleague") do |tweet|
      #   puts "tweet: #{tweet.text} #{client}"
      #   client.publish("/tweets/@premierleague", tweet)
      # end


      twitter_handles = Team.pluck(:twitter) << "@premierleague"

      @@team_stream.track(twitter_handles) do |tweet|
        puts "tweet: #{tweet.text}"
        twitter_handles.each do |handle|
          if tweet.text.include?(handle)
            @@faye_client.publish("/tweets/#{handle}", tweet)
            puts "published to #{handle}"
          end
        end
      end

  end

# Trying to get tweet fro tweeter  and stor to DB
  def self.team_tweets
    # client = Faye::Client.new('http://localhost:9292/faye')

    # twitter_client = Twitter::Streaming::Client.new do |config|
    #     config.consumer_key        = ENV['TWITTER_API_KEY']
    #     config.consumer_secret     = ENV['TWITTER_API_SECRET']
    #     config.access_token        = ENV['ACCESS_TOKEN']
    #     config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    # end


    topics = ["premierleague", "arsenal", "chelsea"]
    # stored_tweets = []
    # tweets_stored = 0
    puts "in team tweets"

    twitter_handles = Team.pluck(:twitter) << "premierleague"
    # puts "#{@@twitter_client}"
    Thread.new do 
      @@twitter_client.filter(track: topics.join(",")) do |tweet|
        puts "tweet: #{tweet.text}"
        twitter_handles.each do |handle|
          if tweet.text.include?(handle)
            @@faye_client.publish("/tweets/#{handle}", tweet)
            puts "published to #{handle}"
          end
        end
      end
    end


    # Thread.new do 
    #   puts "Thread started for #{team.name}"
    #   #puts "Threads: #{Thread.list }"
    #   twitter_client.filter(track: topics.join(",")) do |tweet|
    #     stored_tweets << { username: tweet.attrs[:user][:screenname], tweet_text: tweet.text }
    #     tweets_stored += 1
    #     puts "#{tweets_stored} gathered"
    #     client.publish("/tweets/#{team.channel}", tweet)
    #     if tweets_stored >= 10
    #       puts "Thread for #{team.name} stopped."
    #       Thread.stop 
    #     end
    #     # puts object.text if object.is_a?(Twitter::Tweet)
    #   end
    # end


  end
end
