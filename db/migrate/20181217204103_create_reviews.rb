class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :content
      t.belongs_to :restaurant
      t.belongs_to :user
      t.timestamps
    end
  end
end
