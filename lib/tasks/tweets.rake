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

    chelseafc = TweetStream::Client.new

    chelseafc.follow(22910295) do |status|

      EM.run {
        client = Faye::Client.new('http://localhost:9292/faye')
        client.publish('/tweets/chelsea', status)
      }

    end  
  end

end
