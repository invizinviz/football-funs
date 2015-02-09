class Tweet < ActiveRecord::Base
  belongs_to :team


  def self.publish_tweets(team)
    begin
      team_stream = TweetStream::Client.new
      client = Faye::Client.new('http://localhost:9292/faye')
      # puts "created channel: #{client} :#{team.name} :#{team_stream.object_id}"

      # team_stream.follow(team.tweetstream_id) do |status|
      #   puts "tweet: #{team.name} #{team.channel}"
      #   client.publish("/tweets/#{team.channel}", status)
      #   puts "created channel: #{client}"
      # end

      # stored_tweets = []
      # tweets_stored = 0

      team_stream.track("@premierleague") do |tweet|

        # stored_tweets << { username: tweet.attrs[:user][:screenname], tweet_text: tweet.text }
        # tweets_stored += 1

        # puts "tweet: #{team.name} #{team.channel}"

        client.publish("/tweets/apl", tweet)
        # puts "created channel: #{client.name}"

        # stored_tweets << { username: tweet.attrs[:user][:screenname], tweet_text: tweet.text }
        # tweets_stored += 1
        # puts "#{tweets_stored} gathered"

        # break if tweets_stored >= 10

      end

    rescue Tweetstream::ReconnectError
      puts "Tweetstream crashed due to reconnect error, will restart shortly"
    end
  end

# Trying to get tweet fro tweeter  and stor to DB
  def self.team_tweets(team)
    client = Faye::Client.new('http://localhost:9292/faye')

    twitter_client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_API_KEY']
      config.consumer_secret     = ENV['TWITTER_API_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end

    topics = ["#{team.name}", "tea", "coffee"]
    stored_tweets = []
    tweets_stored = 0


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


    # puts "twitter_client: #{twitter_client}"
    # client = Faye::Client.new('http://localhost:9292/faye')

    # twitter_client.search("to:#{team.name}", result_type: "recent").take(10).each do |tweet|
    #   puts tweet.text
    # end

    # twitter_client.filter(locations: "-122.75,36.8,-121.75,37.8") do |tweet|
    #   client.publish("/tweets/#{team.channel}", tweet)
    # end

    # twitter_client = Twitter::REST::Client.new do |config|
    #   config.consumer_key        = ENV['TWITTER_API_KEY']
    #   config.consumer_secret     = ENV['TWITTER_API_SECRET']
    #   config.access_token        = ENV['ACCESS_TOKEN']
    #   config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    # end

    # twitter_client.user_timeline(team.tweetstream_id).each do |tweet|
    #   team.tweets << tweet
    # end

  end


end
