class RecommendationController < ApplicationController
	def show
		## Get the url from params
		url = params[:url]

		## Extract keywords/topics from url

		## Get the recommended videos from extracted keywords

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
