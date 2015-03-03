class Tweet < ActiveRecord::Base
  belongs_to :team
  belongs_to :user

  validates :user_id, :body, presence: true

  before_create :post_to_twitter

  def post_to_twitter
    user.twitter.update(body)
  end
  
  @@twitter_client ||= Twitter::Streaming::Client.new do |config|
    config.consumer_key        = ENV['FOOTBALL_CUSTOMER_TW_KEY']
    config.consumer_secret     = ENV['FOOTBALL_CUSTOMER_TW_SECRET_KEY']
    config.access_token        = ENV['FOOTBALL_ACCESS_TOKEN']
    config.access_token_secret = ENV['FOOBALL_ACCESS_TOKEN_SECRET']
  end

	#Pusher.app_id = 'PUSHER_APP_ID'
	#Pusher.key = 'PUSHER_APP_KEY'
	#Pusher.secret = 'PUSHER_APP_SECRET'

	Pusher.url = "http://02abdbfcfa5036ae29ec:80af1fa26a84c90bc533@api.pusherapp.com/apps/107665"


  def self.team_tweets
    twitter_handles = Team.pluck(:twitter) << "premierleague"
    
    Thread.new do 
      @@twitter_client.filter(track: twitter_handles.join(","), language: "en") do |tweet|
        twitter_handles.each do |handle|
          if tweet.text.include?(handle)
		        Pusher.trigger(handle, 'my_event', tweet)
            puts "published to #{handle}"
          end
        end
      end
    end
    
  end

end
