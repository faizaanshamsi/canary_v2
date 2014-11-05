FactoryGirl.define do 
  factory :item_special do
    association :item
    association :special
  end
end
