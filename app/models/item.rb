class Item < ActiveRecord::Base
  CONDITIONS = ["Excellent", "Good", "Poor"]
  STATUSES = ["drafted", "published", "sold", "delisted"]

  validates :title, length: { in: 6..100 }  
  validates :dimensions, presence: true, length: { maximum: 100 } 
  validates :brand, presence: true, length: { maximum: 100 } 
  validates :description, length: { in: 20..400 }  
  validates :age, inclusion: { in: 0...10_000 }
  validates :condition, presence: true, inclusion: { in: CONDITIONS }
  validates :status, presence: true, inclusion: { in: STATUSES }

  validates :category, presence: true
  validates :submission, presence: true
  validates :user, presence: true
  validates :location, presence: true

  has_many :asking_prices,
    inverse_of: :item

  accepts_nested_attributes_for :asking_prices

  has_many :offers,
    inverse_of: :item
  has_many :offers,
    inverse_of: :item
  has_many :item_photos,
    inverse_of: :item
  has_many :locations,
    inverse_of: :item

  has_many :item_bundles
  has_many :bundles,
    through: :item_bundles

  has_many :item_specials
  has_many :specials,
    through: :item_specials

  has_many :favorites
  has_many :favoriters,
    through: :favorites
  
  belongs_to :submission
  belongs_to :category
  belongs_to :user 
  belongs_to :location

  def drafted?
    status == 'drafted'
  end

  def default_image
    item_photos.last
  end

  def current_price
    asking_prices.order(created_at: :desc).first
  end

  def listing_price
    asking_prices.order(created_at: :asc).first
  end
end

