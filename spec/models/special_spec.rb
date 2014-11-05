require 'rails_helper'

describe Special do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
  describe 'associations' do
    it { should have_many(:item_specials) }
    it { should have_many(:items).through(:item_specials) }  
  end
end
