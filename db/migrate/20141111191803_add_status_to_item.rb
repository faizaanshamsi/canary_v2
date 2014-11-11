class AddStatusToItem < ActiveRecord::Migration
  def change
    add_column :items, :status, :string, null: false, default: "drafted"
  end
end
