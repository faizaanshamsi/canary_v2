FactoryGirl.define do
  factory :special do
    sequence(:name) { |n| "#{n}Ending Soon!" }
  end
end
