class Bundle < ActiveRecord::Base
  validates :title, presence: true

  has_many :item_bundles,
    inverse_of: :bundle
  has_many :items,
    through: :item_bundles
end
