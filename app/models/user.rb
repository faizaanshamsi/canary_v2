class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  #TODO: FB Sign In

  validates :full_name, presence: true
  validates :email, uniqueness: true
  validates :phone_number, numericality: true, length: { is: 10 },
            uniqueness: true
  validates :second_phone, numericality: true, length: { is: 10 }, allow_nil: true
  validates :zip, length: { is:  5 }
  
  has_many :locations,
    inverse_of: :user

  has_many :offers,
    inverse_of: :user

  has_many :favorites,
    foreign_key: :favoriter_id

  has_many :favorite_items,
    through: :favorites

  def default_location
    locations.find_by(default: true)
  end
end
