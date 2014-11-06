class AddAcceptedOfferToItem < ActiveRecord::Migration
  def change
    add_column :items, :accepted_offer_id, :integer
  end
end
