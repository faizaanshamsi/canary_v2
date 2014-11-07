FactoryGirl.define do 
  factory :location do
    address '1 Water Street'
    city 'Boston'
    state 'MA'
    zip '02134'
    name 'home'
    default false

    association :user
  end
end
