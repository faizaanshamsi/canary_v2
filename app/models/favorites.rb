class Favorite < ActiveRecord::Base
  validates :item, presence: true
  validates :favoriter, presence: true, uniqueness: { scope: :item_id }

  belongs_to :item,
    inverse_of: :favorites

  belongs_to :favoriter,
    inverse_if: :favorites,
    class_name: "User"
end
