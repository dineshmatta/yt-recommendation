class AddVideoIdsToRecommendation < ActiveRecord::Migration
  def change
  	add_column :recommendations, :video_ids, :text
  end
end
