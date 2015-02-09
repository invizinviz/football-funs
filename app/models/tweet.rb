class Tweet < ActiveRecord::Base
  belongs_to :team


  def self.publish_tweets(team)
    puts "team #{team.name}"

    team_stream = TweetStream::Client.new
    client = Faye::Client.new('http://localhost:9292/faye')
    puts "created channel: #{client}"

    # team_stream.follow(team.tweetstream_id) do |status|
    #   puts "tweet: #{team.name} #{team.channel}"
    #   client.publish("/tweets/#{team.channel}", status)
    #   puts "created channel: #{client}"
    # end

    team_stream.track("#{team.name}") do |status|
      puts "tweet: #{team.name} #{team.channel}"
      client.publish("/tweets/#{team.channel}", status)
      puts "created channel: #{client}"
    end
  end

  def self.team_tweets(team)
    # Trying to get tweet fro tweeter  and stor to DB
    
    # twitter_client = Twitter::Streaming::Client.new do |config|
    #   config.consumer_key        = ENV['TWITTER_API_KEY']
    #   config.consumer_secret     = ENV['TWITTER_API_SECRET']
    #   config.access_token        = ENV['ACCESS_TOKEN']
    #   config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    # end
    # puts "twitter_client: #{twitter_client}"
    # client = Faye::Client.new('http://localhost:9292/faye')

    # twitter_client.search("to:#{team.name}", result_type: "recent").take(10).each do |tweet|
    #   puts tweet.text
    # end

    # twitter_client.filter(locations: "-122.75,36.8,-121.75,37.8") do |tweet|
    #   client.publish("/tweets/#{team.channel}", tweet)
    # end

    twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_API_KEY']
      config.consumer_secret     = ENV['TWITTER_API_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end

    twitter_client.user_timeline(team.tweetstream_id).each do |tweet|
      team.tweets << tweet
    end

  end


end
