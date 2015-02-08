class Tweet < ActiveRecord::Base


  def self.publish_tweets(team)
    puts "team #{team.name}"
    

    team_stream = TweetStream::Client.new

    team_stream.follow(team.tweetstream_id) do |status|
      puts "hi #{team.name}"
      client = Faye::Client.new('http://localhost:9292/faye')
      client.publish("/tweets/#{team.name}", status)
    end
  end


  # def che_tweets(id)
  #   chelseafc = TweetStream::Client.new
  #   chelseafc.follow(22910295) do |status|
  #     puts "hi chelsea"
  #     client = Faye::Client.new('http://localhost:9292/faye')
  #     puts "#{client}"
  #     client.publish('/tweets/chelsea', status)
  #   end
  # end


end
