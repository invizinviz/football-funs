class Tweet < ActiveRecord::Base


  def ars_tweets(id)
    arsenalfc = TweetStream::Client.new
    arsenalfc.follow(34613288) do |status|
      puts "hi ars"
      client = Faye::Client.new('http://localhost:9292/faye')
      client.publish('/tweets/arsenal', status)
    end
  end


  def che_tweets(id)
    chelseafc = TweetStream::Client.new
    chelseafc.follow(22910295) do |status|
      puts "hi chelsea"
      client = Faye::Client.new('http://localhost:9292/faye')
      puts "#{client}"
      client.publish('/tweets/chelsea', status)
    end
  end


end
