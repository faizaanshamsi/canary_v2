class Offer < ActiveRecord::Base
  validates :user, presence: true
  validates :item, presence: true

  validates :amount, numericality: true

  belongs_to :item,
    inverse_of: :offers

  belongs_to :user,
    inverse_of: :offers
end
