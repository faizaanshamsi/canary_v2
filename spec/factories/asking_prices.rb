FactoryGirl.define do
  factory :asking_price do
    sequence(:amount, 50) { |n| n }

    association :item
  end
end
