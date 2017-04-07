class Embedvideo::BrightCoveRecommendation < ActiveRecord::Base
	serialize :keywords, Array
	serialize :video_urls, Array 
	serialize :video_ids, Array

	validates :url, :format => URI::regexp(%w(http https))

	def self.get_topics(url)
		## Get the topics from Alchemy API
		results = AlchemyAPI::KeywordExtraction.new.search(url: url)

		## Select the most relevant keyword with relevancy index >= 0.6
		#results.select! {|item| item["relevance"] >= "0.6"}

		results = results.take(1);

		## parse the response and extract the keywords
		keywords = results.collect {|item| item["text"]}

		# if(keywords.length > 0)
		# 	keywords = keywords.join('|').tr(" ", "+")
		# end

		return keywords[0]
	end

	def self.getData(url)
		recommendation = self.where(url: url).first
		if(recommendation.video_urls.length > 0)
			return recommendation.video_urls
		else 
			return nil
		end
		
	end

	def self.saveData(url, video_ids)
		recommendation = self.where(url: url).first
		ids = video_ids.take(3)
		recommendation.video_ids = ids
		recommendation.video_urls = ids.collect {|c| "https://players.brightcove.net/4679196299001/default_default/index.html?videoId="+c}
		recommendation.save
		return recommendation.video_urls
	end
end
