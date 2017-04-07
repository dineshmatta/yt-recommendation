module BrightCoveRecommendationHelper
	def embedVideo(video_id, index)
		video_url = 'http://players.brightcove.net/4679196299001/default_default/index.html?videoId='+video_id
		content_tag(:iframe, nil, src: video_url, allowfullscreen: true,
  		webkitallowfullscreen: true,
  		mozallowfullscreen: true, id: 'recommend'+index.to_s)
	end
end
