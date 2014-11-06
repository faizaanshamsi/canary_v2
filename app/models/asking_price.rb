class AskingPrice < ActiveRecord::Base
  validates :item, presence: true

  belongs_to :item,
    inverse_of: :asking_prices
end
