class CreateItem < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.text   :description, null: false
      t.string :dimensions
      t.string :brand
      t.string :condition, null: false
      t.integer :age
      t.integer :user_id, null: false
      t.integer :submission_id, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
