require 'rails_helper'

describe Location do
  describe 'validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_inclusion_of(:state).in_array(Location::STATES) }
    it { should validate_presence_of(:zip) }
    it { should ensure_length_of(:zip).is_equal_to(5) }
  end
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:items) }
  end
end
