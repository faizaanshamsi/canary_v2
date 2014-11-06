FactoryGirl.define do
  factory :item_bundle do
    association :item
    association :bundle
  end
end
