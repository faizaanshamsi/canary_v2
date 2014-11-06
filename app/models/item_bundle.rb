class ItemBundle < ActiveRecord::Base
  validates :bundle, presence: true
  validates :item, presence: true, uniqueness: { scope: :bundle } 

  belongs_to :bundle, 
    inverse_of: :item_bundles

  belongs_to :item,
    inverse_of: :item_bundles
end
