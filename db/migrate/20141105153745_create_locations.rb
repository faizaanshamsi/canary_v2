class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :name, null: false
      t.boolean :default, null: false, default: false
      t.integer :user_id, null: false

      t.index :user_id
      t.timestamps
    end
  end
end
