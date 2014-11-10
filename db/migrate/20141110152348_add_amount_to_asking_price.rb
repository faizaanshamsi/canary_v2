class AddAmountToAskingPrice < ActiveRecord::Migration
  def change
    add_column :asking_prices, :amount, :decimal, precision: 8, scale: 2, null: false
  end
end
