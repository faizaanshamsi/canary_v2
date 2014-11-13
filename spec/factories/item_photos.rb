FactoryGirl.define do
  factory :item_photo do
    photo 'https://www.filepicker.io/api/file/qcmSLCGuQLi1wLOPdDuo'
    caption 'Best photo'

    association :item, factory: [:item, :published]
  end
end
