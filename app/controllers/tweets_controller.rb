class TweetsController < ApplicationController

	def new 
		@tweet = Tweet.new
	end	

	def create 

	  @tweet = Tweet.new(tweet_params)
	  	client = Twitter::REST::Client.new do |config|
		  config.consumer_key = ENV['CONSUMER_KEY']
		  config.consumer_secret = ENV['CONSUMER_SECRET']
		  config.access_token = ENV['ACCESS_TOKEN']
		  config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
		end

		if @tweet.username.first(1) == '@'
			@username = @tweet.username.to_s.gsub(/\s+/, "").first(15)
		else
			@username = "@" + @tweet.username.to_s.gsub(/\s+/, "").first(15)
		end
		
		@message = @username + " Someone anonomously left you a reveiw. http://www.honest.town/people/" + @tweet.tweetcontent.to_s

		if @tweet.save
			client.update(@message) 
	  	redirect_to "/people/#{@tweet.tweetcontent.to_s}", notice: "This page has been shared with #{@username.to_s}"
		else 
			redirect_to "/people/#{@tweet.tweetcontent.to_s}", alert: "Username can't be blank. Please enter a twitter username to tweet at them."
		end
	 
	
	end

	private
	def tweet_params
	 params.require(:tweet).permit(:tweetcontent, :username)
	end

end