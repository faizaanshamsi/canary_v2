class CreateItemSpecials < ActiveRecord::Migration
  def change
    create_table :item_specials do |t|
      t.integer :item_id, null: false
      t.integer :special_id, null: false

      t.timestamps
    end
    add_index :item_specials, [:item_id, :special_id], unique: true
  end
end
