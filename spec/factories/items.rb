FactoryGirl.define do
  factory :item do
    title 'Great Dining Table'
    description 'This dining table is the best. No scratches!'
    dimensions '10 x 10 feet'
    brand 'IKEA'
    condition 'Excellent'
    age 25
    purchase_price 100.00

    trait :published do
      status 'published'
      after(:create) do |item|
        create(:item_photo, item: item)
      end
    end

    trait :sold do
      status 'sold'
      after(:create) { |item| create(:offer, :accepted, item: item) }
    end

    trait :delisted do
      status 'delisted'
    end

    after(:create) do |item| 
      create(:asking_price, item: item)
    end

    association :user
    association :submission
    association :category
    association :location 
  end
end
