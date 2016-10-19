

class Recommendation 

	include ActiveModel::Model

	attr_accessor :link

	validates :link, :format => URI::regexp(%w(http https))

	def self.get_topics(url)
		## Get the topics from Alchemy API
		results = AlchemyAPI::KeywordExtraction.new.search(url: url)

		## Select the most relevant keyword with relevancy index >= 0.6
		results.select! {|item| item["relevance"] >= "0.6"}

		## parse the response and extract the keywords
		keywords = results.collect {|item| item["text"]}

		if(keywords.length > 0)
			keywords = keywords.join('|').tr(" ", "+")
		end

		return keywords
	end

	def self.get_recommendations(keywords)
		videos = Yt::Collections::Videos.new
		videos_collection = videos.where(part: 'snippet', q: keywords, type: 'video', safe_search: 'none', order: 'viewCount')
		p videos_collection.size

		videos_collection.map(&:id)
		ids = videos_collection.map(&:id).take(10)
		snippets = videos_collection.map(&:snippet).take(10)
		collection = Hash[ids.zip(snippets.map {|i| i})]
		return collection.collect {|key, video| {id: key, title: video.title, desription: video.description, published_at: video.published_at, thumbnail_url: video.thumbnail_url}}
	end

end
