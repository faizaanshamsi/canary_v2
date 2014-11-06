require 'rails_helper'

describe ItemBundle do
  describe 'validations' do
    it { should validate_presence_of(:item) }
    it { should validate_presence_of(:bundle) }
    it 'should validate uniqueness of item scoped to bundle' do
      item_bundle = FactoryGirl.create(:item_bundle) 
      duplicate = FactoryGirl.build(:item_bundle, item: item_bundle.item, bundle: item_bundle.bundle) 

      expect(duplicate).to_not be_valid
    end
  end
  describe 'associations' do
    it { should belong_to(:item) }
    it { should belong_to(:bundle) }
  end
end

