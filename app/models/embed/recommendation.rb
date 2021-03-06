class Embed::Recommendation < ActiveRecord::Base
	serialize :keywords, Array
	serialize :video_urls, Array 
	serialize :video_ids, Array


	def self.get_topics(url)
		# url = 'https://en.wikipedia.org/wiki/Elmo'
		## Get the topics from Alchemy API
		results = AlchemyAPI::KeywordExtraction.new.search(url: url)

		## Select the most relevant keyword with relevancy index >= 0.6
		#results.select! {|item| item["relevance"] >= "0.6"}
		results = results.take(1)

		## parse the response and extract the keywords
		keywords = results.collect {|item| item["text"]}

		# if(keywords.length > 0)
		# 	keywords = keywords.join('|').tr(" ", "+")
		# end

		return keywords[0]
	end

	def self.get_recommendations(keywords, url)
		recommendation = self.where(url: url).first

		if(recommendation.video_urls.length > 0)
			return recommendation.video_urls
		else 
			videos = Yt::Collections::Videos.new
			videos_collection = videos.where(q: keywords, safe_search: 'none', order: 'relevance')
			#videos_collection = videos.where(part: 'snippet', q: keywords, type: 'video', safe_search: 'none', relevanceLanguage: 'en')
			p videos_collection.size

			videos_collection.map(&:id)
			ids = videos_collection.map(&:id).take(3)
			recommendation.video_ids = ids
			recommendation.video_urls = ids.collect {|c| "https://www.youtube.com/embed/"+c}
			recommendation.save
			return recommendation.video_urls
		end
	end

end
