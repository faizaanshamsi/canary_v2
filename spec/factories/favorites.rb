FactoryGirl.define do
  factory :favorite do
    association :item
    association :favoriter
  end
end
