class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :item_id, null: false
      t.integer :favoriter_id, null: false

      t.index :item_id
      t.index :favoriter_id

      t.timestamps
    end
    add_index :favorites, [:item_id, :favoriter_id], unique: true
  end
end
