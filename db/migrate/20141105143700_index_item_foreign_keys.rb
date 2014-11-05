class IndexItemForeignKeys < ActiveRecord::Migration
  def change
    add_index :items, :submission_id
    add_index :items, :category_id
    add_index :items, :user_id
  end
end
