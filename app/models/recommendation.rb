

class Recommendation 

	include ActiveModel::Model

	attr_accessor :link

	validates :link, :format => URI::regexp(%w(http https))

	def self.get_topics(url)
		## Get the topics from Alchemy API
		results = AlchemyAPI::KeywordExtraction.new.search(url: url)

		## parse the response and extract the keywords
		keywords = results.collect {|item| item["text"]}

		if(keywords.length > 0)
			keywords = keywords.join('|')
		end

		return keywords
	end

	def self.get_recommendations(keywords)
		videos = Yt::Collections::Videos.new
		videos_collection = videos.where(q: keywords, safe_search: 'none')
		p videos_collection.size
		videos_collection.map {|video| { id: video.id, title: video.title, desription: video.description, published_at: video.published_at, thumbnail_url: video.thumbnail_url}}
		videos = videos_collection.map {|video| { id: video.id, title: video.title, desription: video.description, published_at: video.published_at, thumbnail_url: video.thumbnail_url}}
		return videos
	end

end
