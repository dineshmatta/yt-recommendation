class Embedvideo::BrightCoveRecommendationController < ApplicationController

	def show
		## Get the url from params and decode it
    	@url = URI.decode(params[:url])

		## Extract keywords/topics from url
    	topics = fetch_topics(@url)#Embed::Recommendation.get_topics(url)

    	## Step 2 : Check if video urls are already present in the db
	 	@video_urls = BrightCoveRecommendation.getData(link)

	 	if(@video_urls == nil)
	 		## Step 3 : Get the recommended videos
	 		@video_ids = BrightCoveService.new().search_videos(topics)

	 		## Step 4 : Save the recommended video for future use
	 		@video_urls = BrightCoveRecommendation.saveData(link, @video_ids)
	 	end
    
		## Get the recommended videos from extracted keywords
    	##@video_ids = BrightCoveService.new().search_videos(topics)
    
		## respond with recommended videos
		render :layout => false
	end

	private

	def fetch_topics(link)
		## Check if exsting record present for url, otherwise fetch it from database
		recommendation = Embedvideo::BrightCoveRecommendation.where(url: link)
		if(!recommendation.blank?)
			topics = recommendation.first.keywords.first
		else
			topics = Embedvideo::BrightCoveRecommendation.get_topics(link)
			Embedvideo::BrightCoveRecommendation.create(url: link, keywords: [topics])
			topics
		end
	end
end
