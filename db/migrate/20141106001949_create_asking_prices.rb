class CreateAskingPrices < ActiveRecord::Migration
  def change
    create_table :asking_prices do |t|
      t.integer :item_id, null: false
      t.boolean :current, default: true

      t.integer :visit_count, default: 0
      t.integer :offer_count, default: 0
      t.integer :question_count, default: 0

      t.index :item_id
      t.timestamps
    end
  end
end
