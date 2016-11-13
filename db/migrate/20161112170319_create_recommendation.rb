class CreateRecommendation < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.text :url
      t.text :keywords

      t.timestamps null: false
    end
  end
end
