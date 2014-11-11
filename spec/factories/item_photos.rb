FactoryGirl.define do
  factory :item_photo do
    photo File.join(Rails.root, '/spec/support/fixtures/table.jpg')
    caption 'Best photo'

    association :item
  end
end
