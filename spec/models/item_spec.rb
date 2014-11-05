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
end
