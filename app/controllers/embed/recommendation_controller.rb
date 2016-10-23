class Embed::RecommendationController < ApplicationController
	def show
		## Get the url from params and decode it
    	url = URI.decode(params[:url])

		## Extract keywords/topics from url
    	topics = Embed::Recommendation.get_topics(url)
    
		## Get the recommended videos from extracted keywords
    	@video_ids = Embed::Recommendation.get_recommendations(topics)
    
		## respond with recommended videos
		render :layout => false
	end

end
