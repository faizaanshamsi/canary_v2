FactoryGirl.define do
  factory :favorite do
    association :item
    association :favoriter, factory: user
  end
end
