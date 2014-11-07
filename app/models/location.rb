class Location < ActiveRecord::Base
  after_create :set_default
  STATES = ['MA']
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true, inclusion: { in: Location::STATES }
  validates :zip, presence: true, length: { is: 5 }
  validates :user, presence: true
  validates :default, uniqueness: { scope: :user_id }, if: :default?
  validates :name, presence: true

  has_many :items,
    inverse_of: :location

  belongs_to :user,
    inverse_of: :locations

  def default?
    default
  end
  def set_default
    update(default: true) if self.class.count <= 1
  end
end
