FactoryGirl.define do
  factory :item do
    title 'Great Dining Table'
    description 'This dining table is the best. No scratches!'
    dimensions '10 x 10 feet'
    brand 'IKEA'
    condition 'Excellent'
    age 25
    
    association :user
    association :submission
    association :category
    association :location 
  end
end
