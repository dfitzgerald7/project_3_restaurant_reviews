class CreateCategory < ActiveRecord::Migration[5.2]
  def change
    t.string :name
    t.belongs_to :restaurants
    t.timestamps
  end
end
