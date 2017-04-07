class BrightCoveRecommendationController < ApplicationController

	def index
  		@recommendation = BrightCoveRecommendation.new
  	end

	def fetch_recommendations
		## Instantiate model
		@brightCoveRecommendation = BrightCoveRecommendation.new(user_params)

		## Fetch Url from params
		link = params[:bright_cove_recommendation][:url]

		## Check if Entered URL is valid
		if(@brightCoveRecommendation.valid?)

			## Step 1 - check if topics are already present for entered URL, if not present, then fetch from Alchemy
			topics = fetch_topics(link)

			## Step 2 : Get the recommended videos
		 	@video_ids = BrightCoveService.new().search_videos(topics)

		 	render "show"

		else
			render "show"
		end
	end

  private

  def fetch_topics(link)
  	## Check if exsting record present for url, otherwise fetch it from database
  	recommendation = BrightCoveRecommendation.where(url: link)
  	if(!recommendation.blank?)
		topics = recommendation.first.keywords.first
  	else
		topics = BrightCoveRecommendation.get_topics(link)
		BrightCoveRecommendation.create(url: link, keywords: [topics])
		topics
  	end
  end
  
  def user_params
	params.require(:bright_cove_recommendation).permit(:url, :keywords => [])
  end
  
end
