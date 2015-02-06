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

    TweetStream::Client.new.track('Chelsea') do |status|

      EM.run {
        client = Faye::Client.new('http://localhost:9292/faye')

        puts "faye server ready #{client}"

        client.subscribe('/tweets/new') do |message|
          puts message.inspect
        end

        client.publish('/tweets/new', 'name' => "#{status.user.name}", 'message' => "#{status.text}")
      }

      
      # puts "#{status.user.name}"
      # puts "#{status.text}"

      # Tweet.create(name: status.user.name, message: status.text)

    end  
  end

end
