require 'tweetstream' 
require 'eventmachine'

namespace :tweets do
  desc "store tweets in redis"
  task store_tweets: :environment do

    TweetStream.configure do |config|
      config.consumer_key  = ENV['TWITTER_API_KEY']
      config.consumer_secret = ENV['TWITTER_API_SECRET']
      config.oauth_token = ENV['ACCESS_TOKEN']
      config.oauth_token_secret = ENV['ACCESS_TOKEN_SECRET']
      config.auth_method = :oauth
    end    

    # EM.run {
    def ars_tweets
      arsenalfc = TweetStream::Client.new
      arsenalfc.follow(34613288) do |status|
        puts "hi ars"
        client = Faye::Client.new('http://localhost:9292/faye')
        client.publish('/tweets/arsenal', status)
      end
    end


    def che_tweets
      chelseafc = TweetStream::Client.new
      chelseafc.follow(22910295) do |status|
        puts "hi chelsea"
        client = Faye::Client.new('http://localhost:9292/faye')
        client.publish('/tweets/chelsea', status)
      end
    end

    threads = []
    threads << Thread.new{ars_tweets}
    threads << Thread.new{che_tweets}

    threads.each { |thr| thr.join }

    # }

  end

end
