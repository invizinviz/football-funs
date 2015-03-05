class User < ActiveRecord::Base
  def self.find_or_create_form_auth_hash(auth_hash)
    #look up the user or create new 
    user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    user.update(
      name: auth_hash.info.nickname,
      profile_image: auth_hash.info.image,
      token: auth_hash.credentials.token,
      secret: auth_hash.credentials.secret
      )
    user
  end

  def twitter
    @tw_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['LOGIN_TWITTER_KEY']
      config.consumer_secret     = ENV['LOGIN_TWITTER_SECRET']
      config.access_token        = token
      config.access_token_secret = secret
    end
    
  end
end
