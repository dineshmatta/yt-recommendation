module Embed::RecommendationHelper

	def embed(youtube_id, index)
	    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}?enablejsapi=1&origin=https://localhost:3000", id: 'recommend'+index.to_s)
	end
end
