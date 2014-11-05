class AddLocationToItem < ActiveRecord::Migration
  def change
    add_column :items, :location_id, :integer, null: false
    add_index :items, :location_id
  end
end
