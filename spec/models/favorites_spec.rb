require 'rails_helper'

describe Favorite do
  describe 'validations' do
    it { should validate_presence_of(:item) }
    it { should validate_presence_of(:favoriter) }
    it "validates uniqueness of favoriter scoped to item" do
      fav = FactoryGirl.create(:favorite)
      duplicate = FactoryGirl.build(:favorite, item: fav.item, favoriter: fav.favoriter)
      expect(duplicate).to_not be_valid
    end
  end
  describe 'associations' do
    it { should belong_to(:item) }
    it { should belong_to(:favoriter) }
  end
end
