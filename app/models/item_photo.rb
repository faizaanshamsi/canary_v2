class ItemPhoto < ActiveRecord::Base
  validates :photo, presence: true
  validates :item, presence: true
  validates :caption, length: { maximum: 40 }
  belongs_to :item,
    inverse_of: :item_photos
end
