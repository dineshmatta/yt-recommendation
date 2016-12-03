module Embed::RecommendationHelper

	def embed(youtube_id, index)
	    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}?enablejsapi=1&origin=https://youtube-rails-dineshdhoom.c9users.io", id: 'recommend'+index.to_s)
	end
end
