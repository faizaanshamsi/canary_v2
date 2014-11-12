FactoryGirl.define do
  factory :offer do
    amount 100

    trait :accepted do
      accepted_at Time.now
    end

    association :user
    association :item
  end
end
