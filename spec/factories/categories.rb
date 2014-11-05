FactoryGirl.define do
  factory :category do
    name 'chair'

    association :room
  end
end
