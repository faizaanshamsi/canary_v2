class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :user_id, null: false
      t.integer :item_id, null: false

      t.float :amount, null: false
      t.datetime :accepted_at

      t.index :user_id
      t.index :item_id
      t.timestamps
    end
  end
end
