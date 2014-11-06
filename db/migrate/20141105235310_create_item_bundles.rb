class CreateItemBundles < ActiveRecord::Migration
  def change
    create_table :item_bundles do |t|
      t.integer :item_id, null: false
      t.integer :bundle_id, null: false

      t.index :bundle_id
      t.index :item_id
      t.timestamps
    end
    add_index :item_bundles, [:item_id, :bundle_id], unique: true
  end
end
