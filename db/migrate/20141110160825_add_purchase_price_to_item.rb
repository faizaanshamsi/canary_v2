class AddPurchasePriceToItem < ActiveRecord::Migration
  def change
    add_column :items, :purchase_price, :decimal, precision: 8, scale: 2
  end
end
