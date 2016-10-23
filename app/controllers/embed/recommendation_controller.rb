class Embed::RecommendationController < ApplicationController
	def show
		## Get the url from params and decode it
    url = URI.decode(params[:url])

		## Extract keywords/topics from url
    topics = Embed::Recommendation.get_topics(url)
    
		## Get the recommended videos from extracted keywords
    @videos = Embed::Recommendation.get_recommendations(topics)
    
		## respond with recommended videos
		render :layout => false
	end

	def index
		@recommendation = Recommendation.new
	end

	def fetch_recommendations
		@recommendation = Recommendation.new(params[:recommendation])
		link = params[:recommendation][:link]

		#@recommendation.link = link

		if(@recommendation.valid?)

	  	##Step 1 : Get the topics
	  	topics = Recommendation.get_topics(link)

	  	##Step 2 : Get the recommended videos
	  	@videos = Recommendation.get_recommendations(topics)

	  	render "show"
	  else
	  	render "show"
	  	#render :index
	  end
	end

end
