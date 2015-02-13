class TweetControler < ApplicationController

	def new 
		@tweet = Tweet.new
	end	


	def create 
	  @sentence = sentence.find(params[:sentence_id])
	  @tweet = @sentence.tweets.create(tweet_params)

		client = Twitter::REST::Client.new do |config|
		  config.consumer_key = 'ulpN3GvX9NkUgoqYgUnhVDHhu'
		  config.consumer_secret = '1l8wgtGSx3hjPsPiHSwuNiPjYOfLl8QZDLEoppnb5sbJhhLeRV'
		  config.access_token = '2991147611-i8TwaBMf9t4VA2TQ7g6y1irPCxTSb24E9xY05Nv'
		  config.access_token_secret = 'j5ShwgAyDsPcRHVJXpGl7NTTAwN54o7bhR9JbC4o4FN65'
		end
	  @message = "This is content from the controller"
	  client.update(@message)
	end

	private
	def tweet_params
	 params.require(:tweet).permit(:tweetcontent)
	end

end