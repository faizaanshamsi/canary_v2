require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'validations' do
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:email) }
    it { should ensure_length_of(:zip).is_equal_to(5) }
    it { should validate_numericality_of(:phone_number) }
    it { should validate_numericality_of(:second_phone).allow_nil } 
    it 'should validate unique attributes' do
      user = FactoryGirl.create(:user)
      invalid_user = FactoryGirl.build(:user,
        email: user.email, phone_number: user.phone_number,
        full_name: user.full_name)
      expect(invalid_user.valid?).to eql(false)
    end
  end

  describe 'associations' do
    it { should have_many(:locations) }
    it { should have_many(:offers) }
    it { should have_many(:favorites) }
    it { should have_many(:favorite_items).through(:favorites) }
  end

end
