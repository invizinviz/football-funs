class TeamsController < ApplicationController
  def index
  end

  def chelsea
    chelseafc = TweetStream::Client.new
    chelseafc.follow(22910295) do |status|
      puts "hi chelsea"
      client = Faye::Client.new('http://localhost:9292/faye')
      client.publish('/tweets/chelsea', status)
    end  
  end

  def arsenal
    ars_tweets()
    arsenalfc = TweetStream::Client.new
    arsenalfc.follow(34613288) do |status|
      puts "hi ars"
      client = Faye::Client.new('http://localhost:9292/faye')
      client.publish('/tweets/arsenal', status)
    end
    
  end
end
