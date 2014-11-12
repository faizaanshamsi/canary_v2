require 'rails_helper'

describe Item do
  describe 'validations' do
    it { should ensure_length_of(:title).is_at_least(6).is_at_most(100) }

    it { should ensure_length_of(:description).is_at_least(20).is_at_most(400) }

    it { should ensure_length_of(:dimensions).is_at_most(100) }
    it { should ensure_length_of(:brand).is_at_most(100) }
    it { should validate_inclusion_of(:age).in_range(0...10_000) }
    it { should validate_inclusion_of(:condition).in_array(Item::CONDITIONS) }

    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:submission) } 
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:status) }
    it { should validate_inclusion_of(:status).in_array(Item::STATUSES) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
    it { should belong_to(:submission) }
    it { should belong_to (:location) }

    it { should have_many(:item_photos) }
    it { should have_many(:offers) }
    it { should have_many(:asking_prices) }
    
    it { should have_many(:item_specials) }
    it { should have_many(:specials).through(:item_specials) }
    
    it { should have_many(:item_bundles) }
    it { should have_many(:bundles).through(:item_bundles) }

    it { should have_many(:favorites) } 
    it { should have_many(:favoriters).through(:favorites) }
  end

  describe 'status methods' do
    it 'returns true if drafted' do
      item = FactoryGirl.create(:item, status: 'drafted')

      expect(item.drafted?).to eql(true)
    end
  end

  describe 'default image' do
    it 'returns the first image' do
      item_photo = FactoryGirl.create(:item_photo)
      item = item_photo.item

      item.reload
      expect(item.default_image).to eql(item_photo)
    end
  end

  describe 'current price' do
    it 'should return the most recent asking price' do
      item = FactoryGirl.create(:item, :published)
      new_price = FactoryGirl.create(:asking_price, item: item)
      
      expect(item.current_price).to eql(new_price)
    end
  end

  describe 'listing_price' do
    it 'returns the original listing price' do
      item = FactoryGirl.create(:item)

      expect(item.listing_price).to eql(item.asking_prices.first)
    end
  end
end
