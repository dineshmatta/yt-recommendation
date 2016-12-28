class AddVideoUrlsToRecommendations < ActiveRecord::Migration
  def change
  	add_column :recommendations, :video_urls, :text
  end
end
