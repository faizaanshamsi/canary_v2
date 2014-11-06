FactoryGirl.define do
  factory :item_photo do
    photo Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/fixtures/table.jpg')))
    caption 'Best photo'

    association :item
  end
end
