class Category < ActiveRecord::Base
  validates :name, presence: true
  validates :room, presence: true
  
  belongs_to :room,
    inverse_of: :categories

  has_many :items,
    inverse_of: :category
end
