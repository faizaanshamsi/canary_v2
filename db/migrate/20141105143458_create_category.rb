class CreateCategory < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.integer :room_id, null: false

      t.index :room_id
    end
  end
end
