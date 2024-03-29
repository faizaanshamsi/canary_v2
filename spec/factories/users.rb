FactoryGirl.define do
  factory :user, aliases: [:favoriter] do
    full_name 'canary bob'
    sequence(:username) { |n| "#{n}canary" }
    sequence(:phone_number, 111_111_1111) { |n| "#{n}".to_i }
    sequence(:email) { |n| "#{n}test@canary.com"}

    address '15 canary lane'
    city 'boston'
    state 'MA'
    zip '02125'

    password 'qwertyui'
    after(:create) { |user| user.confirm! }
  end


end
