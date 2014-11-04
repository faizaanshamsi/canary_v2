require 'rails_helper'

describe Item do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should ensure_length_of(:title).is_at_least(6).is_at_most(100) }

    it { should validate_presence_of(:description) }
    it { should ensure_length_of(:description).is_at_least(20).is_at_most(400) }

    it { should ensure_length_of(:dimensions).is_at_least(1).is_at_most(100) }
    it { should ensure_length_of(:brand).is_at_least(1).is_at_most(100) }
    it { should ensure_length_of(:age).is_at_least(1).is_at_most(100) }

    it { should validate_presence_of(:condition) }
    it { should validate_inclusion_of(:condition).in_array(Item::Conditions) }

    it { should validate_presence_of(:category) }

    it { should validate_presence_of(:submission) } 
    it { should validate_presence_of(:user) }
  end

  describe 'associations' do
    it { should belong_to(:seller) }
    it { should belong_to(:category) }
    it { should belong_to(:submission) }
  end
end
