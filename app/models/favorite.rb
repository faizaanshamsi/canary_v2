class Favorite < ActiveRecord::Base
  validates :item, presence: true
  validates :favoriter, presence: true, uniqueness: { scope: :item_id }

  belongs_to :item,
    inverse_of: :favorites

  belongs_to :favorite_item,
    foreign_key: :item_id,
    class_name: "Item"

  belongs_to :favoriter,
    class_name: "User"
end
