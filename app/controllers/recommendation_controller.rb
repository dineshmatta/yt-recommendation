class RecommendationController < ApplicationController
	
  def index
  	@recommendation = Recommendation.new
  end

  def fetch_recommendations
  	@recommendation = Recommendation.new(user_params)
  	link = params[:recommendation][:url]

		if(@recommendation.valid?)

	  	##Step 1 : Get the topics
	  	topics = fetch_topics(link)

	  	##Step 2 : Get the recommended videos
	  	@video_ids = Recommendation.get_recommendations(topics, link)

	  	render "show"
		else
	  	render "show"
		end
  end

  private

  def fetch_topics(link)
  	## Check if exsting record present for url, otherwise fetch it from database
  	recommendation = Recommendation.where(url: link)
  	if(!recommendation.blank?)
		topics = recommendation.first.keywords.first
  	else
		topics = Recommendation.get_topics(link)
		Recommendation.create(url: link, keywords: [topics])
		topics
  	end
  end
  
  def user_params
		params.require(:recommendation).permit(:url, :keywords => [])
  end
end
