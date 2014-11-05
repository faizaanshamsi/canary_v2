FactoryGirl.define do
  factory :item_photo do
    # TODO: Replace with an uploaded file object after mounting uploader
    photo 'http://placehold.it/350x150'
    caption 'Best photo'

    association :item
  end
end
