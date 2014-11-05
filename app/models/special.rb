class Special < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :item_specials,
    inverse_of: :special
  has_many :items,
    through: :item_specials
end
