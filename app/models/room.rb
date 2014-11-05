class Room < ActiveRecord::Base
  validates :name, presence: true

  has_many :categories,
    inverse_of: :room
end
