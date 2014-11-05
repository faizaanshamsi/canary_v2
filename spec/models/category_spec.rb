require 'rails_helper'

describe Category do
  describe 'validations' do
    it { should validate_presence_of(:name) } 
    it { should validate_presence_of(:room) }
  end
  describe 'associations' do
    it { should belong_to(:room) }
    it { should have_many(:items) }
  end
end
