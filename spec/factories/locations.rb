FactoryGirl.define do 
  factory :location do
    address '1 Water Street'
    city 'Boston'
    state 'MA'
    zip '02134'
    comment 'This is a storage unit'

    association :user
  end
end
