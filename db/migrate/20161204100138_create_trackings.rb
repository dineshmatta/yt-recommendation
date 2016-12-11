class CreateTrackings < ActiveRecord::Migration
  def change
    create_table :trackings do |t|
      t.text :page_url
      t.text :video_url

      t.timestamps null: false
    end
  end
end
