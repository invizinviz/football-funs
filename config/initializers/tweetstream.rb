Tweet.team_tweets
# TweetStream.configure do |config|
#   config.consumer_key  = ENV['FOOTBALL_CUSTOMER_TW_KEY']
#   config.consumer_secret = ENV['FOOTBALL_CUSTOMER_TW_SECRET_KEY']
#   config.oauth_token = ENV['FOOTBALL_ACCESS_TOKEN']
#   config.oauth_token_secret = ENV['FOOBALL_ACCESS_TOKEN_SECRET']
#   config.auth_method = :oauth
# end 



# ############ Using with another app
# TweetStream.configure do |config|
#   config.consumer_key  = ENV['TWITTER_API_KEY']
#   config.consumer_secret = ENV['TWITTER_API_SECRET']
#   config.oauth_token = ENV['ACCESS_TOKEN']
#   config.oauth_token_secret = ENV['ACCESS_TOKEN_SECRET']
#   config.auth_method = :oauth
# end 
# #######################

# @@twitter_client = Twitter::REST::Client.new do |config|
#   config.consumer_key        = ENV['TWITTER_API_KEY']
#   config.consumer_secret     = ENV['TWITTER_API_SECRET']
#   config.access_token        = ENV['ACCESS_TOKEN']
#   config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
# end

# system("rackup faye.ru -s thin -E production")