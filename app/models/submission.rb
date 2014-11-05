class Submission < ActiveRecord::Base
  validates :name, presence: true

  has_many :items, 
    inverse_of: :submission
end
