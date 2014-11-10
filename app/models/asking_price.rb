class AskingPrice < ActiveRecord::Base
  validates :item, presence: true
  validates :amount, numericality: true

  belongs_to :item,
    inverse_of: :asking_prices
end
