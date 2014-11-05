require 'rails_helper'

describe Room do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
  describe 'associations' do
    it { should have_many(:categories) }
  end
end
