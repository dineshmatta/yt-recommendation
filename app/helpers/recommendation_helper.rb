module RecommendationHelper

	def embed(youtube_url, index)
		content_tag(:iframe, nil, src: "#{youtube_url.split(':').last()}", id: 'recommend'+index.to_s)
	end
end
