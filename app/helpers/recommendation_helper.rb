module RecommendationHelper

	def embed(youtube_id, index)
		content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}", id: 'recommend'+index.to_s)
	end
end
