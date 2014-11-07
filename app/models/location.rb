class Location < ActiveRecord::Base
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
  
  def set_or_update_default(new_default)
    update(default: true) if self.class.count <= 1
    update_default if new_default == '1'
  end
  
  private

  def update_default
    old_default = Location.find_by(default: true)
    old_default.update(default: false)
  end
end
