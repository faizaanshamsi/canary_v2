require 'rails_helper'

describe Location do
  describe 'validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_inclusion_of(:state).in_array(Location::STATES) }
    it { should validate_presence_of(:zip) }
    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:zip).is_equal_to(5) }
    it 'should only have one default location per user' do
      first = FactoryGirl.create(:location, default: true)
      user = first.user
      second = FactoryGirl.build(:location, default: true, user: user)

      expect(second).to_not be_valid
    end
  end
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:items) }
  end
end
