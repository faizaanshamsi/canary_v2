require 'rails_helper'

describe Submission do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
  describe 'associations' do
    it { should have_many(:items) }
  end
end
