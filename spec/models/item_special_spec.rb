require 'rails_helper'

describe ItemSpecial do
  describe 'validations' do
    it { should validate_presence_of(:item) }
    it { should validate_presence_of(:special) }
    it 'should validate uniqueness of item scoped to special' do
      item_special = FactoryGirl.create(:item_special) 
      duplicate = FactoryGirl.build(:item_special, item: item_special.item, special: item_special.special)

      expect(duplicate).to_not be_valid
    end
  end
  describe 'associations' do
    it { should belong_to(:item) }
    it { should belong_to(:special) } 
  end
end
