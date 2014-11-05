class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  #TODO: FB Sign In
  #TODO: Username auto created after sign in?

  validates :full_name, presence: true
  validates :email, uniqueness: true
  validates :phone_number, numericality: true, length: { is: 10},
            uniqueness: true
  
  has_many :locations,
    inverse_of: :user
end
