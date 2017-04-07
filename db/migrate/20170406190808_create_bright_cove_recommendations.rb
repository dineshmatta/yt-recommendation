class CreateBrightCoveRecommendations < ActiveRecord::Migration
  def change
    create_table :bright_cove_recommendations do |t|
      t.text :url
      t.text :keywords
      t.text :video_urls
      t.text :video_ids
      t.timestamps null: false
    end
  end
end
