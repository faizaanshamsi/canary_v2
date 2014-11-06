require 'rails_helper'

describe Bundle do
  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
  describe 'associations' do
    it { should have_many(:item_bundles) } 
    it { should have_many(:items).through(:item_bundles) }
  end
end
