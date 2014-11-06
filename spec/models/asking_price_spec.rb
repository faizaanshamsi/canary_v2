require 'rails_helper'

describe AskingPrice do
  describe 'validations' do
    it { should validate_presence_of(:item) }
  end
  describe 'associations' do
    it { should belong_to(:item) } 
  end
end
