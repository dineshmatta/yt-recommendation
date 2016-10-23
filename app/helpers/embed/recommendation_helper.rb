module Embed::RecommendationHelper

	def embed(youtube_id)
	    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
	end
end
