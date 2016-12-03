class TrackingsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  
  def track
    puts "TRACKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK\n"
  	tracking = Tracking.find_by_page_url(params[:page_url])
  	if (params[:page_url] && params[:video_url])
  	end
  	render :nothing => true, :status => 200
  end
end
