class CreateItemPhotos < ActiveRecord::Migration
  def change
    create_table :item_photos do |t|
      t.string :photo, null: false
      t.integer :item_id, null: false
      t.string :caption
      t.index :item_id
      t.timestamps
    end
  end
end
