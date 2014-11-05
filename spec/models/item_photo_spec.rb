require 'rails_helper'

describe ItemPhoto do
  describe 'validations' do
    it { should validate_presence_of(:photo) }
    it { should validate_presence_of(:item) }
    it { should ensure_length_of(:caption).is_at_most(40) }
  end
  describe 'associations' do
    it { should belong_to(:item) } 
  end
end
