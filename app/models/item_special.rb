class ItemSpecial < ActiveRecord::Base
  validates :item, presence: true, uniqueness: { scope: :special_id }
  validates :special, presence: true

  belongs_to :item,
    inverse_of: :item_specials
  belongs_to :special,
    inverse_of: :item_specials
end
