class AddSecondPhone < ActiveRecord::Migration
  def change
    add_column :users, :second_phone, :integer
  end
end
