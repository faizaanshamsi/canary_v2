require 'rails_helper'

describe ItemSpecial do
  describe 'validations' do
    it { should validate_presence_of(:item) }
    it { should validate_presence_of(:special) }
    it { should validate_uniqueness_of(:item).scoped_to(:special_id) }
  end
  describe 'associations' do
    it { should belong_to(:item) }
    it { should belong_to(:special) } 
  end
end
