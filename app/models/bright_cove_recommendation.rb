class BrightCoveRecommendation < ActiveRecord::Base
	serialize :keywords, Array
	serialize :video_urls, Array 
	serialize :video_ids, Array

	#include ActiveModel::Model

	#attr_accessor :link

	validates :url, :format => URI::regexp(%w(http https))

	def self.get_topics(url)
		## Get the topics from Alchemy API
		results = AlchemyAPI::KeywordExtraction.new.search(url: url)

		## Select the most relevant keyword with relevancy index >= 0.6
		#results.select! {|item| item["relevance"] >= "0.6"}

		p 'RESULTTTTTTTTTT\n\n'
		p results
		results = results.take(1);

		## parse the response and extract the keywords
		keywords = results.collect {|item| item["text"]}

		# if(keywords.length > 0)
		# 	keywords = keywords.join('|').tr(" ", "+")
		# end

		return keywords[0]
	end

end
