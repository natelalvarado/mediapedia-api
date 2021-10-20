class CreateMedia < ActiveRecord::Migration[6.1]
  def change
    create_table :media do |t|
      t.integer :user_id
      t.string :media_type
      t.string :title
      t.string :creator
      t.string :genre
      t.string :year
      t.string :image
      t.text :review
      t.string :rating
      t.string :status
      t.string :cast
      t.text :plot

      t.timestamps
    end
  end
end
