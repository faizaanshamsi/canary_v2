class ItemPhoto < ActiveRecord::Base
  validates :photo, presence: true
  validates :item, presence: true
  validates :caption, length: { maximum: 40 }
  validate :number_of_photos

  belongs_to :item,
    inverse_of: :item_photos

  def number_of_photos
    if item && item.item_photos.size >= self.class.max_photos
      errors.add(:number_of_photos, "You may not add more than 10 photos per item")
    end
  end

  def self.max_photos
    10
  end
end
