class Embed::RecommendationController < ApplicationController

	def show
		## Get the url from params and decode it
    	@url = URI.decode(params[:url])

		## Extract keywords/topics from url
    	topics = fetch_topics(@url)#Embed::Recommendation.get_topics(url)
    
		## Get the recommended videos from extracted keywords
    	@video_ids = Embed::Recommendation.get_recommendations(topics)
    
		## respond with recommended videos
		render :layout => false
	end

	private

	def fetch_topics(link)
		## Check if exsting record present for url, otherwise fetch it from database
		recommendation = Embed::Recommendation.where(url: link)
		if(!recommendation.blank?)
			topics = recommendation.first.keywords.first
		else
			topics = Embed::Recommendation.get_topics(link)
			Embed::Recommendation.create(url: link, keywords: [topics])
			topics
		end
	end
end
